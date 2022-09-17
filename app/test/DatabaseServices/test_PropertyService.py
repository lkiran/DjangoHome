from unittest import mock

from django.test import TestCase

from DjangoHome.containers import containers
from app.DatabaseServices.PropertyService import PropertyService
from app.DatabaseServices.ServiceBus import ServiceBus
from app.builders.PropertyBulider import PropertyBuilder
from app.enums import ClassEnum, TypeEnum
from app.models import Property


class TestPropertyService(TestCase):
	propertyService: PropertyService = None
	serviceBusMock = mock.Mock(spec=ServiceBus)

	def setUp(self) -> None:
		self.serviceBusMock.register = mock.Mock(return_value=None)
		containers.serviceBus.override(self.serviceBusMock)

		containers.propertyService.reset()
		self.propertyService = containers.propertyService()

	def test_register(self):
		from app.DatabaseServices.Events import SAVE_PROPERTY
		self.serviceBusMock.register.assert_called_once_with(self.propertyService, SAVE_PROPERTY)

	def test_save_object(self):
		property = PropertyBuilder(ClassEnum.Boolean) \
			.id("prop-1") \
			.name("Status") \
			.callFunction("status") \
			.type(TypeEnum.Read_Only) \
			.value(True) \
			.build()

		self.propertyService.SaveObject(property, False)

		actual = Property.objects.get(pk=property.pk)
		self.assertIsNotNone(actual)
		self.assertEquals('false', actual.Value)
