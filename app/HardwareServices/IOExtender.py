from datetime import datetime

import numpy as np

from app.CommunicationServices.TwoWireInterface import TwoWireInterface
from app.DatabaseServices.ServiceBus import ServiceBus
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.models import Property


class IOExtender(BaseDeviceService):
	def __init__(self, model, serviceBus: ServiceBus):
		BaseDeviceService.__init__(self, model, serviceBus)
		self.Address = 0
		self.Pins = []
		self._InstantiateUsingModel()

	def State(self, **kwargs):
		value = kwargs.get("Value")
		pin = kwargs.get("Pin")
		self.__State(pin, value)

	def __State(self, pin, value=None):
		if value is not None:
			print("Set pin {0} value as {1}".format(pin, value))
			pinObject = self.Pins[pin]
			pinObject.Status = value
		print("Get pin {0} value".format(pin))
		return self.Pins[pin].Status

	def Toggle(self, **kwargs):
		pin = kwargs.get("Pin")
		print(u"Toggling pin: {0}".format(pin))
		currentState = self.__State(pin)
		self.__State(pin, not currentState)
		print("Toggling pin: {0} is completed".format(pin))

	def UpTime(self, **kwargs):
		pin = kwargs.get("Pin")
		activatedOn = self.Pins[pin].ActivatedOn
		if activatedOn is None:
			return 0
		span = (datetime.now() - activatedOn).total_seconds()
		return span

	def DownTime(self, **kwargs):
		pin = kwargs.get("Pin")
		closedOn = self.Pins[pin].ClosedOn
		if closedOn is None:
			return 0
		span = (datetime.now() - closedOn).total_seconds()
		return span

	def _InstantiateUsingModel(self):
		self.Address = self.Model.Parameters.get("Address", "")
		self._PopulatePins(8)

	def _PopulatePins(self, numberOfPins):
		modelProperties = self.Model.Properties
		for i in range(0, numberOfPins):
			pinProperties = modelProperties.filter(Parameters__contains='"Pin":{0}'.format(i))
			pin = Pin(i, pinProperties, self)
			self.Pins.append(pin)


class Pin(object):
	def __init__(self, id, properties, device: IOExtender):
		self.device = device
		self.__i2c = TwoWireInterface.Instance()
		self.Id = id
		self.Properties = properties
		self.Address = device.Address
		self.state: Property = self.Properties.filter(CallFunction='State').first()
		self._Status = self.state.Object
		self._WriteToDevice(self._Status)
		self.ActivatedOn = None
		self.ClosedOn = None

	def _ReadFromDevice(self):
		stateAsByte = self.__i2c.Read(self.Address)
		result = [bool(stateAsByte >> (7 - i) & 1) for i in range(0, 8)]
		return result

	def _WriteToDevice(self, value):
		state = self._ReadFromDevice()
		state[7 - self.Id] = not value
		stateAsByte = np.packbits(np.uint8(state))
		self.__i2c.Write(self.Address, stateAsByte)
		return state

	@property
	def Status(self):
		return self._Status

	@Status.setter
	def Status(self, value):
		if value is True:
			self.ActivatedOn = datetime.now()
			self.ClosedOn = None
			print("Turning on the pin")
		else:
			self.ActivatedOn = None
			self.ClosedOn = datetime.now()
			print("Turning off the pin")
		self._WriteToDevice(value)
		self.state = self.device.SetValue(self.state, value)
		self._Status = self.state.Object
