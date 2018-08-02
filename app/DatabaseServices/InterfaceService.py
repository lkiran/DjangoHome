from app.DatabaseServices.PropertyService import PropertyService
from app.ValueParser import ValueParser


class InterfaceService(object):
	__propertyService = PropertyService.Instance()
	__instance = None

	@staticmethod
	def Instance():
		if InterfaceService.__instance is None:
			InterfaceService()
		return InterfaceService.__instance

	def __init__(self):
		if InterfaceService.__instance is not None:
			raise Exception("InterfaceService is a singleton, use 'InterfaceService.Instance()'")
		else:
			InterfaceService.__instance = self

	def CallEditor(self, model, value):
		parser = ValueParser().Get(model.Editor.Class)
		object = parser.ToObject(value)
		self.__propertyService.SetProperty(model.Editor.Id, object)
