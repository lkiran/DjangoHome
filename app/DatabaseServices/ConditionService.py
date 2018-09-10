import logging

from app.models import Condition
from app.ControlServices import LiveCondition
from app.Repositories.ConditionRepository import ConditionRepository


class ConditionService(object):


	__instance = None
	__logger = logging.getLogger('ConditionService')
	__conditionRepository = ConditionRepository()

	@staticmethod
	def Instance():
		if ConditionService.__instance is None:
			ConditionService()
		return ConditionService.__instance

	def __init__(self):
		if ConditionService.__instance is not None:
			raise Exception("ConditionService is a singleton, use 'ConditionService.Instance()'")
		ConditionService.__instance = self
		self.__populateConditions()

	def __populateConditions(self):
		for condition in Condition.objects.all():
			liveCondition = LiveCondition(condition)
			self.LiveConditions.add(liveCondition)
