import logging
from typing import Tuple

from app.DatabaseServices.Events import NOTIFY_CONDITIONS_OF_PROPERTY
from app.DatabaseServices.Service import Service
from app.DatabaseServices.ServiceBus import ServiceBus
from app.ValueComparator import ValueComparator
from app.models import Condition


class ConditionService(Service):

	def __init__(self, conditionRepository, taskService, deviceService, serviceBus: ServiceBus):
		super().__init__(serviceBus)
		self.__conditionRepository = conditionRepository
		self.__deviceService = deviceService
		self.__taskService = taskService
		self.__logger = logging.getLogger('ConditionService')

	def NotifyConditionsOfProperty(self, property):
		conditions = self.__conditionRepository.GetAllByProperty(property)
		for condition in conditions:
			self.NotifyConditions(condition, property)

	def NotifyConditions(self, condition, property):
		if not self.__isSatisfied(condition, property):
			return
		self.__taskService.ExecuteTasksOfCondition(condition)
		parentConditions = Condition.objects.filter(AndConditions__condition=condition)
		for parentCondition in parentConditions:
			self.NotifyConditions(parentCondition)

	def __isSatisfied(self, condition, property):
		if condition.Property.Id == property.Id:
			propertyValue = property.Value
		else:
			propertyValue = self.__deviceService.getPropertyValue(condition.Property)
		comparator = ValueComparator()
		satisfied = comparator.CompareCondition(condition, propertyValue)
		if not satisfied:
			return False
		for andCondition in condition.AndConditions.all():
			if self.__isSatisfied(andCondition):
				return False
		return True

	def register(self):
		self.serviceBus.register(self, NOTIFY_CONDITIONS_OF_PROPERTY)

	def handle(self, event: str, payload: any):
		if event is NOTIFY_CONDITIONS_OF_PROPERTY:
			return self.NotifyConditionsOfProperty(payload)
