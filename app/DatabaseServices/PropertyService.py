import logging

from app.DatabaseServices.Events import SAVE_PROPERTY
from app.DatabaseServices.Service import Service
from app.DatabaseServices.ServiceBus import ServiceBus
from app.Helpers.PropertyValueHelper import PropertyValueHelper
from app.Repositories.PropertyRepository import PropertyRepository
from app.models import Property


class PropertyService(Service):
	__logger = logging.getLogger('PropertyService')

	def __init__(self, propertyRepository: PropertyRepository, serviceBus: ServiceBus):
		super().__init__(serviceBus)
		self.__propertyRepository = propertyRepository

	def SaveObject(self, property: Property, value: any):
		self.__logger.info(u"SaveObject is called with object={0}; value={1}".format(property, value))
		parser = PropertyValueHelper.GetParser(property)
		property.Value = parser.ToString(value)
		property.save()
		return property

	def register(self):
		self.serviceBus.register(self, SAVE_PROPERTY)

	def handle(self, event: str, payload: any):
		if event is SAVE_PROPERTY:
			return self.SaveObject(payload[0], payload[1])
