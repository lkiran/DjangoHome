import logging

from app.ValueComparator import ValueComparator
from app.models import Condition


class ConditionService(object):
	def __init__(self, conditionRepository, taskService, deviceService):
		self.__conditionRepository = conditionRepository
		self.__deviceService = deviceService
		self.__taskService = taskService
		self.__logger = logging.getLogger('ConditionService')

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
		propertyValue = self.__deviceService.getPropertyValueByPropertyId(condition.Property.Id)
		comparator = ValueComparator()
		satisfied = comparator.CompareCondition(condition, propertyValue)
		if not satisfied:
			return False
		for andCondition in condition.AndConditions.all():
			if self.__isSatisfied(andCondition):
				return False
		return True
