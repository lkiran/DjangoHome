import logging

from app.DatabaseServices.TaskService import TaskService
from app.Repositories.ConditionRepository import ConditionRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.ValueComparator import ValueComparator
from app.models import Condition


class ConditionService(object):
	__instance = None
	__logger = logging.getLogger('ConditionService')
	__conditionRepository = ConditionRepository()
	__propertyRepository = PropertyRepository()

	@staticmethod
	def Instance():
		if ConditionService.__instance is None:
			ConditionService()
		return ConditionService.__instance

	def __init__(self):
		if ConditionService.__instance is not None:
			raise Exception("ConditionService is a singleton, use 'ConditionService.Instance()'")
		ConditionService.__instance = self

	def NotifyConditionsOfProperty(self, property):
		conditions = self.__conditionRepository.GetAllByProperty(property)
		for condition in conditions:
			self.NotifyConditions(condition)

	def NotifyConditions(self, condition):
		if not self.__isSatisfied(condition):
			return
		TaskService.Instance().ExecuteTasksOfCondition(condition)
		parentConditions = Condition.objects.filter(AndConditions__condition=condition)
		for parentCondition in parentConditions:
			self.NotifyConditions(parentCondition)

	def __isSatisfied(self, condition):
		property = self.__propertyRepository.Get(condition.Property.Id)
		comparator = ValueComparator()
		satisfied = comparator.CompareCondition(condition, property.Value)
		if not satisfied:
			return False
		for andCondition in condition.AndConditions.all():
			if self.__isSatisfied(andCondition):
				return False
		return True