from app.DatabaseServices.DeviceService import DeviceService
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum


class PropertyService(object):
	__instance = None
	__propertyRepository = PropertyRepository()
	__deviceService = DeviceService.Instance()

	@staticmethod
	def Instance():
		if PropertyService.__instance is None:
			PropertyService()
		return PropertyService.__instance

	def __init__(self):
		if PropertyService.__instance is not None:
			raise Exception("PropertyService is a singleton, use 'PropertyService.Instance()'")
		else:
			PropertyService.__instance = self

	def SetProperty(self, propertyId, value=None):
		model = self.__propertyRepository.Get(propertyId)
		if model.Type == TypeEnum.Read_Only:
			raise Exception(u"Property '{0}' is read-only".format(model))
		model.Object = value
		functionName = model.CallFunction
		deviceId = model.Device.Id
		callFunction = self.__deviceService.GetProducedDeviceFunction(deviceId, functionName)
		model.Parameters[u"Value"] = model.Value
		kwargs = dict(model.Parameters)
		print(u"Calling '{0}' function of {1} device with arguments {2}".format(functionName, model.Device, kwargs))
		callFunction(**kwargs)

	def GetProperty(self, propertyId):
		model = self.__propertyRepository.Get(propertyId)
		if model.Type == TypeEnum.Write_Only:
			raise Exception(u"Property '{0}' is write-only".format(model))
		functionName = model.CallFunction
		deviceId = model.Device.Id
		callFunction = self.__deviceService.GetProducedDeviceFunction(deviceId, functionName)
		kwargs = dict(model.Parameters)
		print(u"Calling {0} function of {1}".format(callFunction, model.Device))
		return callFunction(**kwargs)
