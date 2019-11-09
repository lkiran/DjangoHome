import logging
from inspect import getmembers, isclass

from app import HardwareServices


class DeviceFactory:
	devices = {}

	def __init__(self):
		self.__collectDevices()
		self.__logger = logging.getLogger('DeviceFactory')

	def __collectDevices(self):
		if self.devices:
			pass
		deviceClasses = getmembers(HardwareServices, lambda o: isclass(o))
		for name, _type in deviceClasses:
			self.devices[name] = _type

	def Produce(self, device):
		self.__logger.info(u'Producing {0} device'.format(device))
		try:
			type = device.CallClass
			return self.devices[type](device)
		except Exception as e:
			print(u'Can not produce the device {0}'.format(device))
			self.__logger.exception(u'Device "{0}" could not be produced!'.format(device), e)

