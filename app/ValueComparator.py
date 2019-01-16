import abc
import sys
from inspect import getmembers, isclass, isabstract

from django.utils.datetime_safe import datetime

from app.ValueParser import ValueParser
from app.ValueTypes import Color
from app.enums import ClassEnum, ComparerEnum


class BaseValueComparator(object):
	@property
	def TemplateClass(self):
		return ClassEnum.Error

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		return not self.NotEqual(value, otherValue)


class ValueComparator:
	comparators = {}

	def __init__(self):
		self.__collectComparators()

	def __collectComparators(self):
		if ValueComparator.comparators:
			return
		comparatorClasses = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in comparatorClasses:
			if isclass(_type) and issubclass(_type, BaseValueComparator) and not isabstract(_type):
				key = _type().TemplateClass
				ValueComparator.comparators[key] = _type()

	def CompareValue(self, _class, value, operator, otherValue):
		_class = ClassEnum(_class)
		comparator = self.comparators.get(_class)
		operator = ComparerEnum(operator)
		compare = getattr(comparator, operator.name)
		parser = ValueParser().Get(_class)
		value = parser.ToObject(value)
		otherValue = parser.ToObject(otherValue)
		result = compare(value, otherValue)
		return result

	def CompareProperty(self, property, operator, otherValue):
		return self.CompareValue(property.Class, property.Value, operator, otherValue)

	def CompareCondition(self, condition, otherValue):
		property = condition.Property
		return self.CompareValue(property.Class, condition.Value, condition.Operator, otherValue)


class BooleanValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.Boolean

	def Equal(self, value, otherValue):
		return value is otherValue


class ColorValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.Color

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class DateValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.Date

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class TimeValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.Time

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class DayOfWeekValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.DayOfWeek

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class StringValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.String

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class DateTimeValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.DateTime

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class IntegerValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.Integer

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass


class EmptyValueComparator(BaseValueComparator):
	@property
	def TemplateClass(self):
		return ClassEnum.Empty

	def Equal(self, value, otherValue):
		pass

	def NotEqual(self, value, otherValue):
		pass

	def Greater(self, value, otherValue):
		pass

	def Smaller(self, value, otherValue):
		pass

	def EqualOrGreater(self, value, otherValue):
		pass

	def EqualOrSmaller(self, value, otherValue):
		pass
