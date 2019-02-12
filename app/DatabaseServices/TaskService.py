import logging

from app.Repositories.TaskRepository import TaskRepository
from app.models import Control


class TaskService(object):
	__instance = None
	__logger = logging.getLogger('TaskService')
	__taskRepository = TaskRepository()

	@staticmethod
	def Instance():
		if TaskService.__instance is None:
			TaskService()
		return TaskService.__instance

	def __init__(self):
		if TaskService.__instance is not None:
			raise Exception("TaskService is a singleton, use 'TaskService.Instance()'")
		TaskService.__instance = self

	def Execute(self, property, value):
		from app.DatabaseServices.DeviceService import DeviceService
		__deviceService = DeviceService.Instance()
		__deviceService.SetProperty(property, value)

	def ExecuteTask(self, task):
		self.Execute(task.Property, task.Value)

	def ExecuteTasksOfControl(self, control):
		for task in control.Tasks.all():
			self.ExecuteTask(task)

	def ExecuteTasksOfCondition(self, condition):
		controls = Control.objects.filter(Conditions=condition)
		for control in controls:
			self.ExecuteTasksOfControl(control)
