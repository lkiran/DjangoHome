import sys
from inspect import getmembers, isclass, isabstract

from app.enums import ClassEnum, TypeEnum
from app.models import Property


class BaseBatchValueOperations(object):
	def __init__(self, properties):
		self.properties = properties

	@property
	def TemplateClass(self):
		return ClassEnum.Error

	@property
	def Category(self):
		return self.properties.first().Category

	@property
	def Type(self):
		return self.properties.first().Type

	@property
	def _baseProperty(self):
		baseProperty = Property()
		baseProperty.Category = self.Category
		baseProperty.Class = self.TemplateClass.value
		return baseProperty

	def convertToGroupProperty(self):
		raise NotImplementedError()


class BatchValueOperations:
	operations = {}

	def __init__(self):
		self.__collectOperations()

	def __collectOperations(self):
		if BatchValueOperations.operations:
			return
		batchOperationClasses = getmembers(sys.modules[__name__], lambda o: isclass(o) and not isabstract(o))
		for name, _type in batchOperationClasses:
			if isclass(_type) and issubclass(_type, BaseBatchValueOperations) and not isabstract(_type):
				key = _type(None).TemplateClass
				BatchValueOperations.operations[key] = _type

	def evaluateProperties(self, properties, operation):
		_class = properties.first().Class  # TODO: do this w/o 'first()'
		operations = self.operations.get(_class)(properties)
		operate = getattr(operations, operation)
		result = operate(properties)
		return result

	def convertToGroupProperty(self, properties):
		_class = properties.first().Class  # TODO: do this w/o 'first()'
		operation =  self.operations.get(ClassEnum(_class))(properties)
		result = operation.convertToGroupProperty()
		if TypeEnum(operation.Type) is not TypeEnum.Read_Or_Write:
			result = [r for r in result if r.Type is TypeEnum(operation.Type)]
		return result


class BooleanBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Boolean

	def set(self, value):
		raise NotImplementedError()

	def calculateOr(self):
		raise NotImplementedError()

	def calculateAnd(self):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		orProperty = self._baseProperty
		orProperty.Name = u"Herhangi biri"
		orProperty.CallFunction = "calculateOr"
		orProperty.Type = TypeEnum.Read_Only.value
		andProperty = self._baseProperty
		andProperty.Name = u"Hepsi"
		andProperty.CallFunction = "calculateAnd"
		andProperty.Type = TypeEnum.Read_Only.value
		return [setProperty, orProperty, andProperty]


class ColorBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Color

	def set(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]


class DateBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Date

	def set(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]


class TimeBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Time

	def set(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]


class DayOfWeekBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.DayOfWeek

	def set(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]


class StringBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.String

	def set(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]


class DateTimeBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.DateTime

	def set(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]


class IntegerBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Integer

	def set(self, value):
		raise NotImplementedError()

	def sum(self, properties):
		return sum(self.Objects(properties))

	def average(self, properties):
		return sum(self.Objects(properties)) / len(properties)

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		sumProperty = self._baseProperty
		sumProperty.Name = u"Toplami"
		sumProperty.CallFunction = "sum"
		sumProperty.Type = TypeEnum.Read_Only.value
		averageProperty = self._baseProperty
		averageProperty.Name = u"Ortalamasi"
		averageProperty.CallFunction = "average"
		averageProperty.Type = TypeEnum.Read_Only.value
		return [setProperty, sumProperty, averageProperty]


class EmptyBatchValueOperations(BaseBatchValueOperations):
	@property
	def TemplateClass(self):
		return ClassEnum.Empty

	def call(self, value):
		raise NotImplementedError()

	def convertToGroupProperty(self):
		setProperty = self._baseProperty
		setProperty.Name = u"Esitle"
		setProperty.CallFunction = "set"
		setProperty.Type = TypeEnum.Write_Only.value
		return [setProperty]
