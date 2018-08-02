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
		if self.parsers:
			pass
		parserClasses = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in parserClasses:
			if isclass(_type) and issubclass(_type, AbsValueParser) and not isabstract(_type):
				key = _type().TemplateClass
				self.parsers[key] = _type

	def Get(self, _class):
		return self.parsers[_class]()


class IntegerValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Integer

	def ToObject(self, value):
		return  int(value)

	def ToString(self, value):
		return str(value)


class BooleanValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Boolean

	def ToObject(self, value):
		if value == '1':
			return True
		elif value == '0':
			return False

	def ToString(self, value):
		if value:
			return '1'
		else:
			return '0'


class ColorValueParser(AbsValueParser):
	@property
	def TemplateClass(self):
		return ClassEnum.Color

	def ToObject(self, value):
		colorsOnly = value[value.find("(") + 1:value.find(")")].split(',')
		red = int(colorsOnly[0])
		green = int(colorsOnly[1])
		blue = int(colorsOnly[2])
		alpha = int(colorsOnly[3])
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


if __name__ == "__main__":
	parser = ValueParser().Get(ClassEnum.Boolean)
	print "ok"
