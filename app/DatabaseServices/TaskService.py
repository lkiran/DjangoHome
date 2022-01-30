import logging

from app.models import Control


class TaskService(object):
	def __init__(self, taskRepository, deviceService):
		self.__taskRepository = taskRepository
		self.__deviceService = deviceService
		self.__logger = logging.getLogger('TaskService')

	def Execute(self, property, value):
		return self.__deviceService.SetProperty(property, value)

	def ExecuteTask(self, task):
		self.Execute(task.Property, task.Value)

	def ExecuteTasksOfControl(self, control):
		for task in control.Tasks.all():
			self.ExecuteTask(task)

	def ExecuteTasksOfCondition(self, condition):
		controls = Control.objects.filter(Conditions=condition)
		for control in controls:
			self.ExecuteTasksOfControl(control)
