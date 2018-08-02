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
			self.Pins[pin].Status = value
		print ("Get pin {0} value".format(pin, value))
		return self.Pins[pin].Status

	def Toggle(self, **kwargs):
		pin = kwargs.get("Pin")
		print("Toggling pin:" + pin)
		self.State(pin, not self.State(pin))
		print("Toggling pin:" + pin + " completed")

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
		self.Address = self.Model.Parameters["Address"]

	def _PopulatePins(self, numberOfPins):
		modelProperties = self.Model.Properties
		for i in range(0, numberOfPins):
			pinProperties = filter(lambda p: p.Parameters['Pin'] == i, modelProperties)
			pin = Pin(pinProperties)
			self.Pins.append(pin)


class Pin:
	def __init__(self, properties):
		self.Properties = properties
		self._Status = filter(lambda p: p.CallFunction == 'State', self.Properties)[0].Object
		self.ActivatedOn = datetime.now() - datetime.timedelta(
			seconds=filter(lambda p: p.CallFunction == 'UpTime', self.Properties)[0].Object)
		self.ClosedOn = datetime.now() - datetime.timedelta(
			seconds=filter(lambda p: p.CallFunction == 'DownTime', self.Properties)[0].Object)

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
		filter(lambda p: p.CallFunction == 'State', self.Properties)[0].Object = value
