from app.DatabaseServices.PropertyService import PropertyService
from app.ValueParser import ValueParser
from app.enums import ClassEnum


class InterfaceService(object):
	__deviceService = PropertyService.Instance()
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
		parser = ValueParser().Get(ClassEnum(model.Editor.Class))
		object = parser.ToObject(value)
		return self.__deviceService.SetProperty(model.Editor.Id, object)