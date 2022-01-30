import logging

from typing import List

from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.HardwareServices.DeviceFactory import DeviceFactory
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum
from app.models import Property


class DeviceService(object):

	def __init__(self, deviceRepository: DeviceRepository, deviceFactory: DeviceFactory):
		self.Devices: List[BaseDeviceService] = []
		self.__deviceRepository = deviceRepository
		self.__factory = deviceFactory
		self.__logger = logging.getLogger('DeviceService')

	def ProduceDevices(self):
		devices = self.__deviceRepository.Get()
		DeviceService.Devices = [(lambda d: self.__factory.Produce(d))(d) for d in devices]
		self.__logger.info(u"All {0} devices are produced".format(len(DeviceService.Devices)))

	def GetProducedDeviceById(self, id):
		return next((d for d in DeviceService.Devices if d and d.Model.Id == id), None)

	def GetProducedDeviceFunction(self, id, functionName):
		producedDevice = self.GetProducedDeviceById(id)
		if producedDevice is None:
			raise Exception("Device is not alive!")
		return getattr(producedDevice, functionName)

	def SetProperty(self, property, value=None):
		if property.Type == TypeEnum.Read_Only:
			raise Exception(u"Property '{0}' is read-only".format(property))
		functionName = property.CallFunction
		deviceId = property.Device.Id
		callFunction = self.GetProducedDeviceFunction(deviceId, functionName)
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
		callFunction = self.GetProducedDeviceFunction(deviceId, functionName)
		kwargs = dict(property.Parameters)
		self.__logger.info(u"Calling {0} function of {1}".format(callFunction, property.Device))
		return callFunction(**kwargs)
