import abc
import sys
from inspect import getmembers, isclass, isabstract

from django.utils.datetime_safe import datetime

from app.ValueTypes import Color
from app.enums import ClassEnum


class AbsValueComparator(object):
	__metaclass__ = abc.ABCMeta

	@abc.abstractmethod
	def Equal(self, value):
		pass

	@abc.abstractmethod
	def NotEqual(self, value):
		pass

	@abc.abstractmethod
	def Greater(self, value):
		pass

	@abc.abstractmethod
	def Smaller(self, value):
		pass

	@abc.abstractmethod
	def EqualOrGreater(self, value):
		pass

	@abc.abstractmethod
	def EqualOrSmaller(self, value):
		pass


class ValueComparator:
	parsers = {}

	def __init__(self):
		self.__collectParsers()

	def __collectParsers(self):
		if self.parsers:
			pass
		parserClasses = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in parserClasses:
			if isclass(_type) and issubclass(_type, AbsValueComparator) and not isabstract(_type):
				key = _type().TemplateClass
				self.parsers[key] = _type

	def Get(self, _class):
		return self.parsers[_class]()


class BooleanValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class ColorValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class DateValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class TimeValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class DayOfWeekValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class StringValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class DateTimeValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class IntegerValueParser(AbsValueComparator):

	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass


class EmptyValueParser(AbsValueComparator):
	def Equal(self, value):
		pass

	def NotEqual(self, value):
		pass

	def Greater(self, value):
		pass

	def Smaller(self, value):
		pass

	def EqualOrGreater(self, value):
		pass

	def EqualOrSmaller(self, value):
		pass