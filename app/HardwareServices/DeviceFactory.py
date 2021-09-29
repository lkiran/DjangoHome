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
			deviceClass = self.devices.get(type, None)
			if not deviceClass:
				raise Exception(u"Cannot find a device class with name {0}".format(type))
			return deviceClass(device)
		except Exception as e:
			e = Exception(u'Can not produce the device {0}'.format(device), e)
			self.__logger.exception(e)
