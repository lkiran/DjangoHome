import logging
from inspect import getmembers, isclass
from typing import Dict

from app import HardwareServices
from app.CommunicationServices.AbcMqttCommunicator import AbcMqttCommunicator
from app.CommunicationServices.MqttClient import MqttClient
from app.DatabaseServices.ServiceBus import ServiceBus
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.models import Device


class DeviceFactory:
	def __init__(self, serviceBus: ServiceBus, mqttClient: MqttClient):
		self.devices: Dict[str, type] = {}
		self.__serviceBus = serviceBus
		self.__mqttClient = mqttClient
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
			if issubclass(deviceClass, AbcMqttCommunicator):
				producedDevice: AbcMqttCommunicator = deviceClass(device, self.__serviceBus, self.__mqttClient)
			else:
				producedDevice: BaseDeviceService = deviceClass(device, self.__serviceBus)
			return producedDevice

		except Exception as e:
			e = Exception(u'Can not produce the device {0}'.format(device), e)
			self.__logger.exception(e)
