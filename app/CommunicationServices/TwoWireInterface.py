import threading

from enum import Enum
from smbus2 import SMBus, SMBusWrapper


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
	Temp_C = 13


class StateType(Enum):
	Empty = 0
	Pressed = 1
	Released = 2
	Clicked = 3
	LongPress = 4
	DoublePress = 5


class TwoWireInterface(object):

	def __init__(self):
		address = 8
		with SMBusWrapper(1) as bus:
			bus.write_byte_data(address, 0, Instruction.TurnOn_TL.value)
			bus.write_byte_data(address, 0, Instruction.Actions_TL.value)
			block = bus.read_i2c_block_data(address, 0, 12)


# self.lock = threading.Lock()


if __name__ == '__main__':
	test = TwoWireInterface()
