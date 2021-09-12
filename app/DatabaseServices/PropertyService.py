import logging

from app.DatabaseServices.ConditionService import ConditionService
from app.Repositories.PropertyRepository import PropertyRepository

from app.ValueParser import ValueParser
from app.enums import TypeEnum
from app.models import Property


class PropertyService(object):
	__instance = None
	__propertyRepository = PropertyRepository()
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

	def SaveObject(self, property: Property, value: any):
		self.__logger.info(u"SaveObject is called with object={0}; value={1}".format(property, value))
		parser = self.GetParser(property)
		property.Value = parser.ToString(value)
		property.save()
		return property