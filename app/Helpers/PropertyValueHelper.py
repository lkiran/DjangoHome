from app.ValueParser import ValueParser
from app.models import Property


class PropertyValueHelper:
	@staticmethod
	def GetParser(property: Property):
		return ValueParser().Get(property.Class)

	@staticmethod
	def GetObject(property: Property):
		parser = PropertyValueHelper.GetParser(property)
		return parser.ToObject(property.Value)