import logging
import threading

from smbus2 import SMBusWrapper


class TwoWireInterface(object):
	__instance = None
	__lock = threading.Lock()

	@staticmethod
	def Instance():
		if TwoWireInterface.__instance is None:
			TwoWireInterface()
		return TwoWireInterface.__instance

	def __init__(self):
		if TwoWireInterface.__instance is not None:
			raise Exception("TwoWireInterface is a singleton, use 'TwoWireInterface.Instance()'")
		else:
			self.__logger = logging.getLogger('TwoWireInterface')
			TwoWireInterface.__instance = self

	def Read(self, address, dataLength=1):
		with self.__lock:
			data = None
			self.__logger.info("Read from {0} address with SMBusWrapper (begin)".format(hex(address)))
			with SMBusWrapper(1) as bus:
				if dataLength > 1:
					data = bus.read_i2c_block_data(address, 0, dataLength)
				else:
					data = bus.read_byte(address, dataLength)
			# if not works data = bus.read_byte_data(address, 0, dataLength)
			self.__logger.info("Read from {0} address with SMBusWrapper (end)".format(hex(address)))
			return data

	def Write(self, address, data):
		with self.__lock:
			self.__logger.info("Write {1} data to {0} with SMBusWrapper (begin)".format(hex(address), data))
			with SMBusWrapper(1) as bus:
				dataLength = len(data)
				if dataLength > 1:
					bus.write_i2c_block_data(address, 0, data)
				else:
					bus.write_byte(address, data)
					# if not works bus.write_byte_data(address, 0, data)
			self.__logger.info("Write {1} data to {0} with SMBusWrapper (end)".format(hex(address),data))