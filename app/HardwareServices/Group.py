from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.ValueTypes import Color

from app.CommunicationServices.TwoWireInterface import TwoWireInterface


class Group(BaseDeviceService):

	def __init__(self, model):
		BaseDeviceService.__init__(self, model)
		self._InstantiateUsingModel()

	def Color(self, **kwargs):
		value = kwargs.get("Value", None)
		if value is None:
			return self._color
		self._color = value

		self.SetValue(self.Model.Properties.filter(CallFunction='Color').first(), value)
		return self._color

	def TransitionTime(self, **kwargs):
		value = kwargs.get("Value", None)
		if value is None:
			return self._transitionTime
		self._transitionTime = value
		self.SetValue(self.Model.Properties.filter(CallFunction='TransitionTime').first(), value)
		return self._transitionTime

	def _InstantiateUsingModel(self):
		properties = self.Model.Properties
		self._address = self.Model.Parameters.get("Address", 0)


		self._color = self.GetValue(properties.filter(CallFunction='Color').first())
		self._transitionTime = self.GetValue(properties.filter(CallFunction='TransitionTime').first())
