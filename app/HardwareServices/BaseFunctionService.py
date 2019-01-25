from app.DatabaseServices.ConditionService import ConditionService
from app.DatabaseServices.PropertyService import PropertyService


class BaseFunctionService(object):
	_propertyService = PropertyService.Instance()
	__conditionService = ConditionService.Instance()

	def GetValue(self, property, default=None):
		if property:
			return self._propertyService.GetObject(property)
		return default

	def SetValue(self, property, value):
		if not property:
			return None
		object = self._propertyService.SaveObject(property, value)
		self.__conditionService.NotifyConditionsOfProperty(object)
		return object
