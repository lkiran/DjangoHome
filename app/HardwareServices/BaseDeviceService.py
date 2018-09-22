import logging

from app.DatabaseServices.PropertyService import PropertyService
from app.models import Device


class BaseClassService(object):
	_propertyService = PropertyService.Instance()

	def __init__(self, model):
		if type(model) is not Device:
			raise Exception("Device model should be passed to constructor")
		self.Model = model
		self.__logger = logging.getLogger(model.Name)

	def GetValue(self, property):
		if property is None:
			return None
		return self._propertyService.GetObject(property)

	def SetValue(self, property, value):
		if property is None:
			return None
		return self._propertyService.SaveObject(property, value)

	def __str__(self):
		return u"{0}".format(self.Model)
