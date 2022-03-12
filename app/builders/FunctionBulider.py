from __future__ import annotations

from typing import List

from app.models import Function, Property


class FunctionBuilder(object):
	_id = "",
	_name = "",
	_properties = []

	def id(self, id: str) -> FunctionBuilder:
		self._id = id
		return self

	def name(self, name: str) -> FunctionBuilder:
		self._name = name
		return self

	def property(self, property: Property) -> FunctionBuilder:
		self._properties.append(property)
		return self

	def properties(self, properties: List[Property]) -> FunctionBuilder:
		self._properties = properties
		return self

	def build(self) -> Function:
		function = Function(Id=self._id, Name=self._name)
		function.save()
		for property in self._properties:
			property.save()
			function.Properties.add(property)
		return function
