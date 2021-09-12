from app.DatabaseServices.ConditionService import ConditionService
from app.DatabaseServices.PropertyService import PropertyService
from app.models import Property


class BaseFunctionService(object):
	_propertyService = PropertyService.Instance()
	__conditionService = ConditionService.Instance()

	def GetValue(self, property, default=None):
		if property:
			return self._propertyService.GetObject(property)
		return default

	def SetValue(self, property: Property, value):
		if not property:
			return None
		property = self._propertyService.SaveObject(property, value)
		self.__conditionService.NotifyConditionsOfProperty(property)
		return property
