from unittest import mock

from django.test import TestCase

from DjangoHome.containers import containers
from app.DatabaseServices.ConditionService import ConditionService
from app.DatabaseServices.DeviceService import DeviceService
from app.DatabaseServices.ServiceBus import ServiceBus
from app.DatabaseServices.TaskService import TaskService
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.builders.ConditionBulider import ConditionBuilder
from app.builders.DeviceBulider import DeviceBuilder
from app.builders.FunctionBulider import FunctionBuilder
from app.builders.PropertyBulider import PropertyBuilder
from app.enums import ClassEnum, TypeEnum, ComparerEnum
from app.models import Device, Function, Property


class TestDevice(BaseDeviceService):
	def status(self):
		return False


class ConditionServiceTest(TestCase):
	taskServiceMock = mock.Mock(spec=TaskService)
	serviceBusMock = mock.Mock(spec=ServiceBus)
	deviceService: DeviceService = None
	conditionService: ConditionService = None
	property: Property = None
	function: Function = None
	device: Device = None

	def setUp(self):
		containers.taskService.override(self.taskServiceMock)
		containers.serviceBus.override(self.serviceBusMock)

		self.deviceService = containers.deviceService()
		self.conditionService = containers.conditionService()

		self.property = PropertyBuilder(ClassEnum.Boolean) \
			.id("prop-1") \
			.name("Status") \
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

		self.condition = ConditionBuilder(self.property) \
			.id("condition-1") \
			.operator(ComparerEnum.Equal) \
			.value(True) \
			.build()

	def test_notifyConditionsOfProperty_shouldPass(self):
		testDevice: BaseDeviceService = TestDevice(self.device, self.serviceBusMock)
		self.deviceService.appendDevice(testDevice)
		self.taskServiceMock.ExecuteTasksOfCondition = mock.Mock(return_value=None)

		self.conditionService.NotifyConditionsOfProperty(self.property)

		self.taskServiceMock.ExecuteTasksOfCondition.assert_called_once_with(self.condition)
