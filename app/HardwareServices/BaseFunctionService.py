from app.DatabaseServices.Events import NOTIFY_CONDITIONS_OF_PROPERTY, SAVE_PROPERTY
from app.DatabaseServices.ServiceBus import ServiceBus
from app.Helpers.PropertyValueHelper import PropertyValueHelper
from app.models import Property


class BaseFunctionService(object):
	def __init__(self, serviceBus: ServiceBus):
		self.serviceBus: ServiceBus = serviceBus

	def SetValue(self, property: Property, value):
		if not property:
			return None
		property = self.serviceBus.get(SAVE_PROPERTY, [property, value])
		self.serviceBus.get(NOTIFY_CONDITIONS_OF_PROPERTY, property)
		return property
