import logging

from app.ValueComparator import ValueComparator
from app.models import Condition


class ConditionService(object):
	def __init__(self, conditionRepository, propertyRepository, taskService):
		__conditionRepository = conditionRepository
		__propertyRepository = propertyRepository
		__taskService = taskService
		__logger = logging.getLogger('ConditionService')

	def NotifyConditionsOfProperty(self, property):
		conditions = self.__conditionRepository.GetAllByProperty(property)
		for condition in conditions:
			self.NotifyConditions(condition)

	def NotifyConditions(self, condition):
		if not self.__isSatisfied(condition):
			return
		self.__taskService.ExecuteTasksOfCondition(condition)
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
