import collections
import logging

import shortuuid

from app.Repositories.ConditionRepository import ConditionRepository
from app.Repositories.TaskRepository import TaskRepository
from app.enums import ModelStatus
from app.models import Control, Task


class ControlRepository:
	def __init__(self, taskRepository: TaskRepository, conditionRepository: ConditionRepository):
		self.__taskRepo = taskRepository
		self.__conditionRepo = conditionRepository
		self.__logger = logging.getLogger('ControlRepository')

	def Get(self, id=None):
		if id is None:
			return Control.objects.all()
		try:
			return Control.objects.get(Id=id)
		except Control.DoesNotExist:
			return None

	def GetByCondition(self, condition):
		self.__logger.info("GetByCondition is called")
		try:
			return Control.objects.filter(Condition=condition)
		except Control.DoesNotExist:
			return None

	def Save(self, data):
		model = Control()
		model.Id = data['Id']
		model.Name = data['Name']

		tasksToBeDeleted = set(model.Tasks.all())
		taskList = data['Tasks']
		for taskDict in taskList:
			task = self.__taskRepo.Save(taskDict)
			model.Tasks.add(task.Id)
			if task in tasksToBeDeleted:
				tasksToBeDeleted.remove(task)
		self.DisassociteTask(model, tasksToBeDeleted)

		conditionsToBeDeleted = set(model.Conditions.all())
		conditionList = data['Conditions']
		for conditionDict in conditionList:
			condition = self.__conditionRepo.Save(conditionDict)
			model.Conditions.add(condition.Id)
			if condition in conditionsToBeDeleted:
				conditionsToBeDeleted.remove(condition)
		self.DisassociteCondition(model, conditionsToBeDeleted)

		control = self.Get(model.Id)
		status = self.Status(model, control)

		if status is ModelStatus.New:
			model.Id = shortuuid.random(10)
			model.save()
			print(u"{0} is Created".format(model))

		elif status is ModelStatus.Modified:
			model.save()
			print(u"{0} is Updated".format(model))

		return model

	def DisassociteTask(self, control, tasks):
		for task in tasks:
			control.Tasks.remove(task)
			print(u"{0} is Deleted".format(task))

	def DisassociteCondition(self, control, conditions):
		for condition in conditions:
			control.Conditions.remove(condition)
			print(u"{0} is Deleted".format(condition))

	def Status(self, model, control=None):
		if control is None:
			control = self.Get(model.Id)
		if not control:
			return ModelStatus.New

		if control.Name is model.Name:
			return ModelStatus.Modified

		if collections.Counter(model.Tasks.all()) == collections.Counter(control.Tasks.all()):
			return ModelStatus.Modified

		if collections.Counter(model.Conditions.all()) == collections.Counter(control.Conditions.all()):
			return ModelStatus.Modified

		return ModelStatus.Same
