from __future__ import annotations

from typing import List, Type

from app.models import Device, Function


class DeviceBuilder(object):
	_id = "",
	_name = "",
	_callClass = "",
	_parameters = {},
	_functions = []

	def id(self, id: str) -> DeviceBuilder:
		self._id = id
		return self

	def name(self, name: str) -> DeviceBuilder:
		self._name = name
		return self

	def callClass(self, callClass: Type) -> DeviceBuilder:
		self._callClass = callClass.__name__
		return self

	def parameters(self, parameters) -> DeviceBuilder:
		self._parameters = parameters
		return self

	def function(self, function: Function) -> DeviceBuilder:
		self._functions.append(function)
		return self

	def functions(self, functions: List[Function]) -> DeviceBuilder:
		self._functions = functions
		return self

	def build(self) -> Device:
		device = Device(Id=self._id,
						Name=self._name,
						CallClass=self._callClass,
						Parameters=self._parameters)
		device.save()
		for function in self._functions:
			function.save()
			device.Functions.add(function)
		return device
