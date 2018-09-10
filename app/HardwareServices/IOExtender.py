from datetime import datetime

from app.HardwareServices.BaseDeviceService import BaseClassService


class IOExtender(BaseClassService):
	def __init__(self, model):
		BaseClassService.__init__(self, model)
		self.Address = 0
		self.Pins = []
		self._InstantiateUsingModel()
		self._PopulatePins(4)

	def State(self, **kwargs):
		value = kwargs.get("Value")
		pin = kwargs.get("Pin")
		if value is not None:
			print ("Set pin {0} value as {1}".format(pin, value))
			pinObject = self.Pins[pin]
			pinObject.Status = value
		print ("Get pin {0} value".format(pin, value))
		return self.Pins[pin].Status

	def __State(self, pin, value=None):
		parameters = dict()
		parameters['Pin'] = pin
		parameters['Value'] = value
		return self.State(**parameters)

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

	def _PopulatePins(self, numberOfPins):
		modelProperties = self.Model.Properties
		for i in range(0, numberOfPins):
			pinProperties = modelProperties.filter(Parameters={'Pin': i})
			pin = Pin(pinProperties)
			self.Pins.append(pin)


class Pin(object):
	def __init__(self, properties):
		self.Properties = properties
		state = self.Properties.filter(CallFunction='State').first()
		self._Status = False
		if state:
			self._Status = state.Object
		self.ActivatedOn = None
		self.ClosedOn = None

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
		self._Status = value
		self.Properties.filter(CallFunction='State').first().Object = value
