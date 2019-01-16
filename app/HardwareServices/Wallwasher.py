from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.ValueTypes import Color


class Wallwasher(BaseDeviceService):
	def __init__(self, model):
		BaseDeviceService.__init__(self, model)
		self._color = Color(0, 0, 0, 0)
		self._transitionTime = 0
		self._InstantiateUsingModel()

	def State(self, **kwargs):
		value = kwargs.get("Value")
		pin = kwargs.get("Pin")
		if value is not None:
			print ("Set pin {0} value as {1}".format(pin, value))
			self.Pins[pin].Status = value
		print ("Get pin {0} value".format(pin, value))
		return self.Pins[pin].Status

	def Color(self, **kwargs):
		value = kwargs.get("Value")
		if value is None:
			return self._color
		self._color = value
		self.SetValue(self.Model.Properties.filter(CallFunction='Color').first(), value)
		return self._color

	def TransitionTime(self, **kwargs):
		pass

	def _InstantiateUsingModel(self):
		properties = self.Model.Properties

		self._color = self.GetValue(properties.filter(CallFunction='Color').first())
		self._transitionTime = self.GetValue(properties.filter(CallFunction='TransitionTime').first())
