import abc
import sys
from inspect import getmembers, isclass, isabstract

from django.utils.datetime_safe import datetime

from app.ValueParser import ValueParser
from app.ValueTypes import Color
from app.enums import ClassEnum, ComparerEnum


class BaseBatchValueOperations(object):
	@property
	def TemplateClass(self):
		return ClassEnum.Error

	def Objects(self, properties):
		return [property.Object for property in properties]


class BatchValueOperations:
	comparators = {}

	def __init__(self):
		self.__collectOperations()

	def __collectOperations(self):
		if BatchValueOperations.comparators:
			return
		batchOperationClasses = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in batchOperationClasses:
			if isclass(_type) and issubclass(_type, BaseBatchValueOperations) and not isabstract(_type):
				key = _type().TemplateClass
				BatchValueOperations.comparators[key] = _type()

	def evaluateProperties(self, properties, operation):
		_class = properties.firts().Class  # TODO: do this w/o 'first()'
		operations = self.comparators.get(_class)
		operate = getattr(operations, operation)
		result = operate(properties)
		return result


class BooleanBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Boolean


class ColorBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Color


class DateBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Date


class TimeBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Time


class DayOfWeekBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.DayOfWeek


class StringBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.String


class DateTimeBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.DateTime


class IntegerBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Integer

	def sum(self, properties):
		return sum(self.Objects(properties))

	def average(self, properties):
		return sum(self.Objects(properties)) / len(properties)


class EmptyBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Empty
