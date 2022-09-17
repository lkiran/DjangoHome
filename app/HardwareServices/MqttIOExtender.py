from datetime import datetime

import numpy as np
import paho.mqtt.client as mqtt

from app.DatabaseServices.ServiceBus import ServiceBus
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.models import Device, Property


class MqttIOExtender(BaseDeviceService):
	def __init__(self, model: Device, serviceBus: ServiceBus):
		BaseDeviceService.__init__(self, model, serviceBus)
		self.Pins = []
		self.Address = 0
		self.macAddress = 0
		self.serverIp = ""
		self.serverPort: int
		self.client: mqtt.Client = mqtt.Client(client_id="IOExtender")
		self._instantiateUsingModel()

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

	def _instantiateUsingModel(self):
		self.Address = self.Model.Parameters.get("Address", "")
		self.macAddress = self.Model.Parameters.get("macAddress", "")
		self.serverIp = self.Model.Parameters.get("serverIp", "localhost")
		self.serverPort = int(self.Model.Parameters.get("serverPort", "1883"))
		self.client.connect(self.serverIp, self.serverPort)
		self.client.loop_start()
		self._populatePins(8)

	def _populatePins(self, numberOfPins):
		modelProperties = self.Model.Properties
		for i in range(0, numberOfPins):
			pinProperties = modelProperties.filter(Parameters__contains='"Pin":{0}'.format(i))
			pin = Pin(i, pinProperties, self)
			self.Pins.append(pin)


class Pin(object):
	def __init__(self, id: int, properties, device: MqttIOExtender):
		self.Id = id
		self.ioExtender: MqttIOExtender = device
		self.Properties = properties
		self.state: Property = self.Properties.filter(CallFunction='State').first()
		self._Status = self.state.Object
		# self._writeToDevice(self._Status) TODO: fix this
		self.ActivatedOn = None
		self.ClosedOn = None

	def _readFromDevice(self):
		result = [not self.ioExtender.Pins[i].Status for i in range(0, len(self.ioExtender.Pins))]
		return result

	def _writeToDevice(self, value):
		state = self._readFromDevice()
		state[self.Id] = not value
		stateAsByte = np.packbits(np.uint8(state))
		topic: str = "{0}/i2c/{1}".format(self.ioExtender.macAddress, self.ioExtender.Address)
		self.ioExtender.client.publish(topic, int(stateAsByte))
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
		self._writeToDevice(value)
		self.state = self.device.SetValue(self.state, value)
		self._Status = self.state.Object
