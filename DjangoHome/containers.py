from dependency_injector import containers, providers

from app.CommunicationServices.MqttClient import MqttClient
from app.DatabaseServices.ConditionService import ConditionService
from app.DatabaseServices.ControlService import ControlService
from app.DatabaseServices.DeviceService import DeviceService
from app.DatabaseServices.GroupService import GroupService
from app.DatabaseServices.InterfaceService import InterfaceService
from app.DatabaseServices.PropertyService import PropertyService
from app.DatabaseServices.ServiceBus import ServiceBus
from app.DatabaseServices.TaskService import TaskService
from app.HardwareServices.DeviceFactory import DeviceFactory
from app.Repositories.ConditionRepository import ConditionRepository
from app.Repositories.ControlRepository import ControlRepository
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.FunctionRepository import FunctionRepository
from app.Repositories.GroupRepository import GroupRepository
from app.Repositories.InterfaceRepository import InterfaceRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.Repositories.TaskRepository import TaskRepository


class Container(containers.DeclarativeContainer):
	config = providers.Configuration()

	mqttClient: MqttClient = providers.ThreadSafeSingleton(
		MqttClient,
		serverIp=config.mqtt.serverIp,
		serverPort=config.mqtt.serverPort,
		id=config.mqtt.id
	)
	propertyRepository: PropertyRepository = providers.ThreadSafeSingleton(
		PropertyRepository
	)
	functionRepository: FunctionRepository = providers.ThreadSafeSingleton(
		FunctionRepository,
		propertyRepository
	)
	deviceRepository: DeviceRepository = providers.ThreadSafeSingleton(
		DeviceRepository,
		functionRepository
	)
	conditionRepository: ConditionRepository = providers.ThreadSafeSingleton(
		ConditionRepository
	)
	groupRepository: GroupRepository = providers.ThreadSafeSingleton(
		GroupRepository,
		propertyRepository=propertyRepository
	)
	taskRepository: TaskRepository = providers.ThreadSafeSingleton(
		TaskRepository,
		propertyRepository=propertyRepository
	)
	controlRepository: ControlRepository = providers.ThreadSafeSingleton(
		ControlRepository,
		taskRepository=taskRepository,
		conditionRepository=conditionRepository
	)
	prefabRepository: PropertyRepository = providers.ThreadSafeSingleton(
		PropertyRepository
	)
	interfaceRepository: InterfaceRepository = providers.ThreadSafeSingleton(
		InterfaceRepository
	)
	serviceBus: ServiceBus = providers.ThreadSafeSingleton(
		ServiceBus
	)
	deviceFactory: DeviceFactory = providers.ThreadSafeSingleton(
		DeviceFactory,
		serviceBus=serviceBus,
		mqttClient=mqttClient
	)
	propertyService: PropertyService = providers.ThreadSafeSingleton(
		PropertyService,
		propertyRepository=propertyRepository,
		serviceBus=serviceBus
	)
	deviceService: DeviceService = providers.ThreadSafeSingleton(
		DeviceService,
		deviceRepository=deviceRepository,
		deviceFactory=deviceFactory
	)
	taskService: TaskService = providers.ThreadSafeSingleton(
		TaskService,
		taskRepository=taskRepository,
		deviceService=deviceService
	)
	conditionService: ConditionService = providers.ThreadSafeSingleton(
		ConditionService,
		conditionRepository=conditionRepository,
		deviceService=deviceService,
		taskService=taskService,
		serviceBus=serviceBus
	)
	controlService: ControlService = providers.ThreadSafeSingleton(
		ControlService
	)
	groupService: GroupService = providers.ThreadSafeSingleton(
		GroupService,
		propertyRepository=propertyRepository,
		functionRepository=functionRepository,
		groupRepository=groupRepository
	)
	interfaceService: InterfaceService = providers.ThreadSafeSingleton(
		InterfaceService,
		taskService=taskService
	)


containers = Container()
containers.config.from_dict({
	"mqtt": {
		"serverIp": "rabbitmq",
		"serverPort": 1883,
		"id": "DjangoHomeClient"
	}
})
for provider in [p for (k, p) in containers.providers.items() if p.kwargs.get('serviceBus')]:
	provider()  # instantiate services that depends on the bus
