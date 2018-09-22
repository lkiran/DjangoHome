from app.DatabaseServices.PropertyService import PropertyService


class BaseFunctionService(object):
	_propertyService = PropertyService.Instance()

	def GetValue(self, property, default=None):
		if property:
			return self._propertyService.GetObject(property)
		return default

	def SetValue(self, property, value):
		if property:
			return self._propertyService.SaveObject(property, value)
		return None
