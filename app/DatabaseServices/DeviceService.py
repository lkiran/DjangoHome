import logging
from typing import List

from app.DatabaseServices.PropertyService import PropertyService
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.HardwareServices.DeviceFactory import DeviceFactory
from app.Repositories.DeviceRepository import DeviceRepository
from app.enums import TypeEnum
from app.models import Property


class DeviceService(object):

	def __init__(self, deviceRepository: DeviceRepository, deviceFactory: DeviceFactory):
		self.Devices: List[BaseDeviceService] = []
		self.__deviceRepository = deviceRepository
		self.__factory = deviceFactory
		self.__logger = logging.getLogger('DeviceService')

	def appendDevice(self, device: BaseDeviceService) -> None:
		self.Devices.append(device)

	def produceDevices(self):
		devices = self.__deviceRepository.Get()
		self.Devices = [(lambda d: self.__factory.Produce(d))(d) for d in devices]
		self.__logger.info(u"All {0} devices are produced".format(len(self.Devices)))

	def getProducedDeviceById(self, id: str) -> BaseDeviceService:
		return next((d for d in self.Devices if d and d.Model.Id == id), None)

	def getProducedDeviceFunction(self, id, functionName):
		producedDevice = self.getProducedDeviceById(id)
		if producedDevice is None:
			raise Exception("Device is not alive!", self.Devices)
		return getattr(producedDevice, functionName)

	def setProperty(self, property: Property, value=None) -> any:
		if property.Type == TypeEnum.Read_Only:
			raise Exception(u"Property '{0}' is read-only".format(property))
		functionName = property.CallFunction
		deviceId = property.Device.Id
		callFunction = self.getProducedDeviceFunction(deviceId, functionName)
		parsedValue = property.Parser.ToObject(value)
		property.Parameters[u"Value"] = parsedValue
		kwargs = dict(property.Parameters)
		self.__logger.info(
			u"Calling '{0}' function of {1} device with arguments {2}".format(functionName, property.Device, kwargs))
		return callFunction(**kwargs)

	def getPropertyValue(self, property: Property) -> any:
		if property.Type == TypeEnum.Write_Only:
			raise Exception(u"Property '{0}' is write-only".format(property))
		functionName: str = property.CallFunction
		deviceId: str = property.Device.Id
		callFunction = self.getProducedDeviceFunction(deviceId, functionName)
		kwargs = dict(property.Parameters)
		self.__logger.info(u"Calling {0} function of {1}".format(callFunction, property.Device))
		return callFunction(**kwargs)
