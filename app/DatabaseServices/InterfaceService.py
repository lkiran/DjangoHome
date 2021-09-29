from app.DatabaseServices.TaskService import TaskService


class InterfaceService(object):
	def __init__(self, taskService: TaskService):
		self.__taskService = taskService

	def CallEditor(self, model, value):
		return self.__taskService.Execute(model.Editor, value)
