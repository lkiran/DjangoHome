import logging

from app.HardwareServices.DeviceFactory import DeviceFactory
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum


class DeviceService(object):
	Devices = []

	__instance = None
	__logger = logging.getLogger('DeviceService')
	__deviceRepository = DeviceRepository()
	__propertyRepository = PropertyRepository()

	@staticmethod
	def Instance():
		if DeviceService.__instance is None:
			DeviceService()
		return DeviceService.__instance

	def __init__(self):
		if DeviceService.__instance is not None:
			raise Exception("DeviceService is a singleton, use 'DeviceService.Instance()'")
		else:
			self.__logger.info("Init")
			DeviceService.__instance = self

	def ProduceDevices(self):
		devices = self.__deviceRepository.Get()
		factory = DeviceFactory()
		DeviceService.Devices = [(lambda d: factory.Produce(d))(d) for d in devices]
		print u"All {0} devices are produced".format(len(DeviceService.Devices))

	def GetProducedDeviceById(self, id):
		return next((d for d in DeviceService.Devices if d.Model.Id == id), None)

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
		print(u"Calling '{0}' function of {1} device with arguments {2}".format(functionName, property.Device, kwargs))
		return callFunction(**kwargs)

	def GetProperty(self, propertyId):
		model = self.__propertyRepository.Get(propertyId)
		if model.Type == TypeEnum.Write_Only:
			raise Exception(u"Property '{0}' is write-only".format(model))
		functionName = model.CallFunction
		deviceId = model.Device.Id
		callFunction = self.GetProducedDeviceFunction(deviceId, functionName)
		kwargs = dict(model.Parameters)
		print(u"Calling {0} function of {1}".format(callFunction, model.Device))
		return callFunction(**kwargs)