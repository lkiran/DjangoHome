from django.test import TestCase

from DjangoHome.urls import container
from app.DatabaseServices.DeviceService import DeviceService
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.builders.DeviceBulider import DeviceBuilder
from app.builders.FunctionBulider import FunctionBuilder
from app.builders.PropertyBulider import PropertyBuilder
from app.enums import ClassEnum, TypeEnum
from app.models import Device, Function, Property


class TestDevice(BaseDeviceService):
	def __init__(self, model):
		super().__init__(model)
		self._status: bool = False

	def status(self):
		return self._status


class DeviceServiceTest(TestCase):
	deviceService: DeviceService = container.deviceService()
	property: Property = None
	function: Function = None
	device: Device = None

	def setUp(self):
		self.property = PropertyBuilder(ClassEnum.Boolean) \
			.id("prop-1") \
			.name("status") \
			.callFunction("status") \
			.type(TypeEnum.Read_Only) \
			.value(True) \
			.build()

		self.function = FunctionBuilder() \
			.id("function-1") \
			.name("function 1") \
			.property(self.property) \
			.build()

		self.device = DeviceBuilder() \
			.id("test-device") \
			.name("test device") \
			.callClass(TestDevice) \
			.function(self.function) \
			.build()

	def test_getPropertyValue_shouldReturnValue(self):
		testDevice = TestDevice(self.device)
		self.deviceService.appendDevice(testDevice)
		value: bool = self.deviceService.getPropertyValue(self.property)
		self.assertEquals(False, value)

	def test_getPropertyValueByPropertyId_shouldReturnValue(self):
		testDevice: BaseDeviceService = TestDevice(self.device)
		self.deviceService.appendDevice(testDevice)
		value: bool = self.deviceService.getPropertyValue(self.property)
		self.assertEquals(False, value)
