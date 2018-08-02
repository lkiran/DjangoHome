from app.HardwareServices.BaseDeviceService import BaseClassService
from app.ValueTypes import Color


class Wallwasher(BaseClassService):
	def __init__(self, model):
		BaseClassService.__init__(self, model)
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
		self._color=value

	def TransitionTime(self, **kwargs):
		pass

	def _InstantiateUsingModel(self):
		properties = self.Model.Properties
		self._color = properties.filter(lambda p: p.CallFunction == 'Color', self.Properties)[0].Object
		self._transitionTime = properties.filter(lambda p: p.CallFunction == 'TransitionTime', self.Properties)[0].Object
