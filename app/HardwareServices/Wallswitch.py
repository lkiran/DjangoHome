import threading
import time

from enum import Enum

# from app.CommunicationServices.TwoWireInterface import TwoWireInterface
from app.HardwareServices.BaseDeviceService import BaseDeviceService


class Instruction(Enum):
	NoneInstruction = 0
	TurnOn_TL = 1
	TurnOff_TL = 2
	TurnOn_TR = 3
	TurnOff_TR = 4
	TurnOn_BL = 5
	TurnOff_BL = 6
	TurnOn_BR = 7
	TurnOff_BR = 8
	Actions_TL = 9
	Actions_TR = 10
	Actions_BL = 11
	Actions_BR = 12
	HasChange = 13
	Temp_C = 14


class StateType(Enum):
	Empty = 0
	Pressed = 1
	Released = 2
	Clicked = 3
	LongPress = 4
	DoublePress = 5


class Wallswitch(BaseDeviceService):
	__i2c = None #TwoWireInterface.Instance()

	def __init__(self, model):
		BaseDeviceService.__init__(self, model)
		self.Address = 0
		self.Buttons = []
		self._InstantiateUsingModel()
		self.__controlThread = None
		self.__checkDevice()

	def Pressed(self, **kwargs):
		button = kwargs.get("Button"),
		pass

	def Released(self, **kwargs):
		button = kwargs.get("Button")
		pass

	def Clicked(self, **kwargs):
		button = kwargs.get("Button")
		pass

	def LongPressed(self, **kwargs):
		button = kwargs.get("Button")
		pass

	def DoublePressed(self, **kwargs):
		button = kwargs.get("Button")
		pass

	def Light(self, **kwargs):
		value = kwargs.get("Value")
		button = kwargs.get("Button")
		if value is not None:
			print("Set button {0} light as {1}".format(button, value))
			pinObject = self.Buttons[button]
			pinObject.Status = value
		print("Get button {0} light status".format(button))
		return self.Buttons[button].Status

	def __checkDevice(self):
		self.__i2c.Write(self.Address, Instruction.HasChange.value)
		hasChange = self.__i2c.Read(self.Address, 1)
		if hasChange > 0:
			b = [int(x) for x in list('{0:04b}'.format(hasChange))]
			if b[0]:
				self.__i2c.Write(self.Address, Instruction.Actions_BR.value)
				actions = self.__i2c.Read(self.Address, 12)
			if b[1]:
				self.__i2c.Write(self.Address, Instruction.Actions_BL.value)
				actions = self.__i2c.Read(self.Address, 12)
			if b[2]:
				self.__i2c.Write(self.Address, Instruction.Actions_FR.value)
				actions = self.__i2c.Read(self.Address, 12)
			if b[3]:
				self.__i2c.Write(self.Address, Instruction.Actions_FL.value)
				actions = self.__i2c.Read(self.Address, 12)
		self.__controlThread = threading.Timer(2, self.__checkDevice)

	def _InstantiateUsingModel(self):
		self.Address = self.Model.Parameters.get("Address", "")
		self.__PopulateButtons(4)

	def __PopulateButtons(self, numberOfButtons):
		modelProperties = self.Model.Properties
		for i in range(0, numberOfButtons):
			buttonProperties = modelProperties.filter(Parameters={'Button': i})
			button = Button(buttonProperties)
			self.Buttons.append(button)

class Button(object):
	def __init__(self, properties):
		self.Properties = properties
		self._Status = False

	@property
	def Status(self):
		return self._Status
