from __future__ import annotations

from typing import Generic, TypeVar, Any, Dict

from app.ValueParser import ValueParser
from app.enums import TypeEnum, ClassEnum
from app.models import Property, Category

T = TypeVar("T")


class PropertyBuilder(Generic[T]):
	_id: str = "",
	_name: str = "",
	_callFunction: str = ""
	_parameters: Dict = {},
	_value: Any = None
	_type: int = TypeEnum.Read_Or_Write.value
	_class: int = ClassEnum.String.value
	_comparable: bool = True
	_category: Category = None

	def __init__(self, classType: ClassEnum):
		self._class = classType.value
		self.parser = ValueParser().Get(classType)

	def id(self, id: str) -> PropertyBuilder:
		self._id = id
		return self

	def name(self, name: str) -> PropertyBuilder:
		self._name = name
		return self

	def callFunction(self, callFunction: str) -> PropertyBuilder:
		self._callFunction = callFunction
		return self

	def parameters(self, parameters: Dict) -> PropertyBuilder:
		self._parameters = parameters
		return self

	def value(self, value: Any) -> PropertyBuilder:
		self._value = self.parser.ToString(value)
		return self

	def type(self, type: TypeEnum) -> PropertyBuilder:
		self._type = type.value
		return self

	def comparable(self, comparable: bool) -> PropertyBuilder:
		self._comparable = comparable
		return self

	def category(self, category: Category) -> PropertyBuilder:
		self._category = category
		return self

	def build(self) -> Property:
		property = Property(Id=self._id,
							Name=self._name,
							CallFunction=self._callFunction,
							Parameters={},  # TODO: fix this
							Value=self._value,
							Type=self._type,
							Class=self._class,
							Comparable=self._comparable,
							Category=self._category)
		property.save()
		return property
