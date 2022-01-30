from typing import Optional

from app.DatabaseServices.ConditionService import ConditionService
from app.DatabaseServices.Events import NOTIFY_CONDITIONS_OF_PROPERTY, SAVE_PROPERTY
from app.DatabaseServices.PropertyService import PropertyService
from app.DatabaseServices.ServiceBus import ServiceBus
from app.Helpers.PropertyValueHelper import PropertyValueHelper
from app.models import Property


class BaseFunctionService(object):
	def __init__(self):
		self.serviceBus: ServiceBus = None

	def setServiceBus(self, serviceBus: ServiceBus):
		self.serviceBus = serviceBus

	def GetValue(self, property: Property, default=None):
		if property:
			return PropertyValueHelper.GetObject(property)
		return default

	def SetValue(self, property: Property, value):
		if not property:
			return None
		self.serviceBus.get(SAVE_PROPERTY, [property, value])
		self.serviceBus.get(NOTIFY_CONDITIONS_OF_PROPERTY, property)
		return property