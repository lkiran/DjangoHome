import abc
import sys
from inspect import getmembers, isclass, isabstract

from django.utils.datetime_safe import datetime

from app.ValueTypes import Color
from app.enums import ClassEnum


class AbsValueParser(object):
	__metaclass__ = abc.ABCMeta

	@abc.abstractproperty
	def TemplateClass(self):
		return ClassEnum.Error

	@abc.abstractmethod
	def ToObject(self, value):
		pass

	@abc.abstractmethod
	def ToString(self, value):
		pass


class ValueParser:
	parsers = {}

	def __init__(self):
		self.__collectParsers()

	def __collectParsers(self):
		if ValueParser.parsers:
			return
		parserClasses = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in parserClasses:
			if isclass(_type) and issubclass(_type, AbsValueParser) and not isabstract(_type):
				key = _type().TemplateClass
				ValueParser.parsers[key] = _type()

	def Get(self, _class):
		if _class is not ClassEnum:
			_class = ClassEnum(_class)
		parserClass = ValueParser.parsers.get(_class)
		if parserClass:
			return parserClass
		return None


class IntegerValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Integer

	def ToObject(self, value):
		return int(value)

	def ToString(self, value):
		return str(value)


class BooleanValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Boolean

	def ToObject(self, value):
		value = value.lower()
		if value == 'true':
			return True
		elif value == 'false':
			return False

	def ToString(self, value):
		if value:
			return 'true'
		else:
			return 'false'


class ColorValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Color

	def ToObject(self, value):
		colorsOnly = value[value.find("(") + 1:value.find(")")].split(',')
		red = int(colorsOnly[0])
		green = int(colorsOnly[1])
		blue = int(colorsOnly[2])
		if value[0:value.find("(")] == "rgba":
			alpha = float(colorsOnly[3])
		else:
			alpha = 1.0
		return Color(red, green, blue, alpha)

	def ToString(self, value):
		return str(value)


class DateValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Date

	def ToObject(self, value):
		pass

	def ToString(self, value):
		pass


class TimeValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Time

	def ToObject(self, value):
		pass

	def ToString(self, value):
		pass


class DayOfWeekValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.DayOfWeek

	def ToObject(self, value):
		pass

	def ToString(self, value):
		pass


class StringValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.String

	def ToObject(self, value):
		pass

	def ToString(self, value):
		pass


class DateTimeValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.DateTime

	def ToObject(self, value):
		return datetime.now()

	def ToString(self, value):
		return str(datetime.now())


class EmptyValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Empty

	def ToObject(self, value):
		return None

	def ToString(self, value):
		return u''