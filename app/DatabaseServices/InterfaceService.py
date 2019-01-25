from app.DatabaseServices.TaskService import TaskService


class InterfaceService(object):
	__taskService = TaskService.Instance()
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
		return self.__taskService.Execute(model.Editor, value)