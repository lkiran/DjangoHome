from inspect import getmembers, isclass

from app import HardwareServices


class DeviceFactory:
	devices = {}

	def __init__(self):
		self.__collectDevices()

	def __collectDevices(self):
		if self.devices:
			pass
		deviceClasses = getmembers(HardwareServices, lambda o: isclass(o))
		for name, _type in deviceClasses:
			self.devices[name] = _type

	def Produce(self, device):
		print(u'Producing {0} device'.format(device))
		type = device.CallClass
		return self.devices[type](device)
