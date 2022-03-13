from __future__ import annotations

from app.ValueParser import ValueParser, AbsValueParser
from app.enums import ComparerEnum, ClassEnum
from app.models import Property, Condition


class ConditionBuilder(object):
	_id: str = ""
	_operator: int = ComparerEnum.Equal.value
	_property = ""
	_value = ""

	def __init__(self, property: Property):
		self._property = property
		self.parser: AbsValueParser = ValueParser().Get(ClassEnum(property.Class))

	def id(self, id: str) -> ConditionBuilder:
		self._id = id
		return self

	def operator(self, operator: ComparerEnum) -> ConditionBuilder:
		self._operator = operator.value
		return self

	def value(self, value: any) -> ConditionBuilder:
		self._value = self.parser.ToString(value)
		return self

	def build(self) -> Condition:
		condition = Condition(Id=self._id, Property=self._property, Operator=self._operator, Value=self._value)
		condition.save()
		return condition
