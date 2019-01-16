import logging

from app.DatabaseServices.ConditionService import ConditionService
from app.Repositories.PropertyRepository import PropertyRepository

from app.ValueParser import ValueParser
from app.enums import TypeEnum


class PropertyService(object):
	__instance = None
	__propertyRepository = PropertyRepository()
	__conditionService = ConditionService.Instance()
	__logger = logging.getLogger('PropertyService')

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

	def GetParser(self, object):
		return ValueParser().Get(object.Class)

	def GetObject(self, object):
		parser = self.GetParser(object)
		return parser.ToObject(object.Value)

	def SaveObject(self, object, value):
		self.__logger.info(u"SaveObject is called with object={0}; value={1}".format(object, value))
		parser = self.GetParser(object)
		object.Value = parser.ToString(value)
		object.save()
		self.__conditionService.NotifyConditionsOfProperty(object)
		return object

	def GetProducedDeviceFunction(self, id, functionName):
		producedDevice = self.GetProducedDeviceById(id)
		if producedDevice is None:
			raise Exception("Device is not alive!")
		return getattr(producedDevice, functionName)

	def SetProperty(self, propertyId, value=None):
		model = self.__propertyRepository.Get(propertyId)
		if model.Type == TypeEnum.Read_Only:
			raise Exception(u"Property '{0}' is read-only".format(model))
		functionName = model.CallFunction
		deviceId = model.Device.Id
		callFunction = self.GetProducedDeviceFunction(deviceId, functionName)
		model.Parameters[u"Value"] = value
		kwargs = dict(model.Parameters)
		print(u"Calling '{0}' function of {1} device with arguments {2}".format(functionName, model.Device, kwargs))
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