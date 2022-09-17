import logging
from inspect import getmembers, isclass
from typing import Dict, Type

from app import HardwareServices
from app.DatabaseServices.PropertyService import PropertyService
from app.DatabaseServices.ServiceBus import ServiceBus
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.models import Device


class DeviceFactory:
	def __init__(self, serviceBus: ServiceBus):
		self.devices: Dict[str, type] = {}
		self.__serviceBus = serviceBus
		self.__collectDevices()
		self.__logger = logging.getLogger('DeviceFactory')

	def __collectDevices(self):
		if self.devices:
			pass
		deviceClasses = getmembers(HardwareServices, lambda o: isclass(o))
		for name, _type in deviceClasses:
			self.devices[name] = _type

	def Produce(self, device: Device):
		self.__logger.info(u'Producing {0} device'.format(device))
		try:
			type = device.CallClass
			deviceClass = self.devices.get(type, None)
			if not deviceClass:
				raise Exception(u"Cannot find a device class with name {0}".format(type))
			producedDevice: BaseDeviceService = deviceClass(device, self.__serviceBus)
			return producedDevice

		except Exception as e:
			e = Exception(u'Can not produce the device {0}'.format(device), e)
			self.__logger.exception(e)
