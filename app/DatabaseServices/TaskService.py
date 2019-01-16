import logging

from app.DatabaseServices.DeviceService import DeviceService
from app.Repositories.TaskRepository import TaskRepository
from app.models import Control


class TaskService(object):
	__instance = None
	__logger = logging.getLogger('TaskService')
	__taskRepository = TaskRepository()
	__deviceService = DeviceService.Instance()

	@staticmethod
	def Instance():
		if TaskService.__instance is None:
			TaskService()
		return TaskService.__instance

	def __init__(self):
		if TaskService.__instance is not None:
			raise Exception("TaskService is a singleton, use 'TaskService.Instance()'")
		TaskService.__instance = self

	def ExecuteTask(self, task):
		self.__deviceService.SetProperty(task.Property, task.Value)
		raise NotImplemented

	def ExecuteTasksOfControl(self, control):
		for task in control.Tasks:
			self.ExecuteTask(task)

	def ExecuteTasksOfCondition(self, condition):
		controls = Control.objects.filter(Conditions=condition)
		for control in controls:
			self.ExecuteTasksOfControl(control)
