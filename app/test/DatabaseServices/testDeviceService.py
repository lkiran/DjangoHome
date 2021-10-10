from django.test import TestCase

from DjangoHome.urls import container
from app.DatabaseServices.DeviceService import DeviceService
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.enums import ClassEnum, TypeEnum
from app.models import Device, Function, Property


class TestDevice(BaseDeviceService):
	def status(self):
		return False


class DeviceServiceTest(TestCase):
	deviceService: DeviceService = container.deviceService()
	property: Property = None
	function: Function = None
	device: Device = None

	def setUp(self):
		self.property = Property(Id="prop-1",
								 Name="status",
								 CallFunction="status",
								 Parameters={},
								 Value="True",
								 Type=TypeEnum.Read_Only.value,
								 Class=ClassEnum.Boolean.value,
								 Comparable=False,
								 Category=None)
		self.property.save()

		self.function = Function(
			Id="function-1",
			Name="function 1")
		self.function.save()
		self.function.Properties.add(self.property)

		self.device = Device(
			Id="test-device",
			Name="test device",
			CallClass="TestDevice",
			Parameters={},
		)
		self.device.save()
		self.device.Functions.add(self.function)

	def test_getPropertyValue_shouldReturnValue(self):
		testDevice = TestDevice(self.device)
		DeviceService.Devices.append(testDevice)

		value: bool = self.deviceService.getPropertyValue(self.property)

		self.assertEquals(False, value)

	def test_getPropertyValueByPropertyId_shouldReturnValue(self):
		testDevice = TestDevice(self.device)
		DeviceService.Devices.append(testDevice)

		value: bool = self.deviceService.getPropertyValueByPropertyId(self.property.Id)

		self.assertEquals(False, value)
