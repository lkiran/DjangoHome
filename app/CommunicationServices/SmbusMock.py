class SMBus(object):

	def __init__(self, bus=None, force=False):
		self.fd = None
		self.address = None
		self.force = force
		self._force_last = None

	def read_byte(self, i2c_addr, force=None):
		print("read_byte", i2c_addr, force)
		return 1

	def write_byte(self, i2c_addr, value, force=None):
		print("write_byte", i2c_addr, value, force)

	def read_i2c_block_data(self, i2c_addr, register, length, force=None):
		print("read_i2c_block_data", i2c_addr, register, length, force)
		return [a for a in range(length)]

	def write_i2c_block_data(self, i2c_addr, register, data, force=None):
		print("write_i2c_block_data", i2c_addr, register, data, force)


class SMBusWrapper:
	def __init__(self, bus_number=0, auto_cleanup=True, force=False):
		self.bus_number = bus_number
		self.auto_cleanup = auto_cleanup
		self.force = force

	def __enter__(self):
		self.bus = SMBus(bus=self.bus_number, force=self.force)
		return self.bus

	def __exit__(self, exc_type, exc_val, exc_tb):
		pass