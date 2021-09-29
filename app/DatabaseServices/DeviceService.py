import logging

from app.HardwareServices.DeviceFactory import DeviceFactory
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum
from app.models import Property


class DeviceService(object):
	Devices = []

	def __init__(self, deviceRepository: DeviceRepository, propertyRepository: PropertyRepository):
		self.__deviceRepository = deviceRepository
		self.__propertyRepository = propertyRepository
		self.__logger = logging.getLogger('DeviceService')

	def ProduceDevices(self):
		devices = self.__deviceRepository.Get()
		factory = DeviceFactory()
		DeviceService.Devices = [(lambda d: factory.Produce(d))(d) for d in devices]
		self.__logger.info(u"All {0} devices are produced".format(len(DeviceService.Devices)))

	def GetProducedDeviceById(self, id):
		return next((d for d in DeviceService.Devices if d and d.Model.Id == id), None)

	def GetProducedDeviceFunction(self, id, functionName):
		producedDevice = self.GetProducedDeviceById(id)
		if producedDevice is None:
			raise Exception("Device is not alive!")
		return getattr(producedDevice, functionName)

	def SetPropertyById(self, propertyId, value=None):
		model = self.__propertyRepository.Get(propertyId)
		self.SetProperty(model, value)

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

	def getPropertyValueByPropertyId(self, propertyId: str):
		model = self.__propertyRepository.Get(propertyId)
		return self.getPropertyValue(model)

	def getPropertyValue(self, property: Property) -> any:
		if property.Type == TypeEnum.Write_Only:
			raise Exception(u"Property '{0}' is write-only".format(property))
		functionName: str = property.CallFunction
		deviceId: str = property.Device.Id
		callFunction = self.GetProducedDeviceFunction(deviceId, functionName)
		kwargs = dict(property.Parameters)
		self.__logger.info(u"Calling {0} function of {1}".format(callFunction, property.Device))
		return callFunction(**kwargs)
