from app.CommunicationServices.TwoWireInterface import TwoWireInterface
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.ValueTypes import Color


class Wallwasher(BaseDeviceService):
	__i2c = TwoWireInterface.Instance()

	def __init__(self, model):
		BaseDeviceService.__init__(self, model)
		self._color = Color(0, 0, 0, 0)
		self._transitionTime = 0
		self._address = 0
		self._redMax = 0
		self._greenMax = 0
		self._blueMax = 0
		self._InstantiateUsingModel()

	def Color(self, **kwargs):
		value = kwargs.get("Value", None)
		if value is None:
			return self._color
		self._color = value
		i2cData = value.toList() + int_to_bytes(self._transitionTime, length=4)
		i2cData[0] = int(float(self._color.Red) / 255 * self._redMax)
		i2cData[1] = int(float(self._color.Green) / 255 * self._greenMax)
		i2cData[2] = int(float(self._color.Blue) / 255 * self._blueMax)
		i2cData[3] = int(self._color.Alpha * 255)
		Wallwasher.__i2c.Write(self._address, i2cData)
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
		self._redMax = self.Model.Parameters.get("RedMax", 0)
		self._greenMax = self.Model.Parameters.get("GreenMax", 0)
		self._blueMax = self.Model.Parameters.get("BlueMax", 0)

		self._color = properties.filter(CallFunction='Color').first().Object
		self._transitionTime = properties.filter(CallFunction='TransitionTime').first().Object


def int_to_bytes(value, length):
	result = []
	for i in range(0, length):
		result.append(value >> (i * 8) & 0xff)
	result.reverse()
	return result
