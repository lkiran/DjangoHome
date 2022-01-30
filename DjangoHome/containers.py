from dependency_injector import containers, providers

from app.Controllers.AndConditionController import AndConditionController
from app.Controllers.ConditionController import ConditionController
from app.Controllers.ControlController import ControlController
from app.Controllers.DeviceController import DeviceController
from app.Controllers.FunctionController import FunctionController
from app.Controllers.GroupController import GroupController
from app.Controllers.InterfaceController import InterfaceController
from app.Controllers.PropertyController import PropertyController
from app.Controllers.PropertyInfoController import PropertyInfoController
from app.Controllers.TaskController import TaskController
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

	propertyRepository: PropertyRepository = providers.Singleton(
		PropertyRepository
	)
	functionRepository: FunctionRepository = providers.Singleton(
		FunctionRepository,
		propertyRepository
	)
	deviceRepository: DeviceRepository = providers.Singleton(
		DeviceRepository,
		functionRepository
	)
	conditionRepository: ConditionRepository = providers.Singleton(
		ConditionRepository
	)
	groupRepository: GroupRepository = providers.Singleton(
		GroupRepository,
		propertyRepository=propertyRepository
	)
	taskRepository: TaskRepository = providers.Singleton(
		TaskRepository,
		propertyRepository=propertyRepository
	)
	controlRepository: ControlRepository = providers.Singleton(
		ControlRepository,
		taskRepository=taskRepository,
		conditionRepository=conditionRepository
	)
	prefabRepository: PropertyRepository = providers.Singleton(
		PropertyRepository
	)
	interfaceRepository: InterfaceRepository = providers.Singleton(
		InterfaceRepository
	)
	serviceBus: ServiceBus = providers.Singleton(
		ServiceBus
	)
	deviceFactory: DeviceFactory = providers.Singleton(
		DeviceFactory,
		serviceBus=serviceBus
	)
	deviceService: DeviceService = providers.Singleton(
		DeviceService,
		deviceRepository=deviceRepository,
		deviceFactory=deviceFactory
	)
	taskService: TaskService = providers.Singleton(
		TaskService,
		taskRepository=taskRepository,
		deviceService=deviceService
	)
	propertyService: PropertyService = providers.Singleton(
		PropertyService,
		propertyRepository=propertyRepository,
		serviceBus=serviceBus
	)
	conditionService: ConditionService = providers.Singleton(
		ConditionService,
		conditionRepository=conditionRepository,
		deviceService=deviceService,
		taskService=taskService,
		serviceBus=serviceBus
	)
	controlService: ControlService = providers.Singleton(
		ControlService
	)
	groupService: GroupService = providers.Singleton(
		GroupService,
		propertyRepository=propertyRepository,
		functionRepository=functionRepository,
		groupRepository=groupRepository
	)
	interfaceService: InterfaceService = providers.Singleton(
		InterfaceService,
		taskService=taskService
	)
	andConditionController: AndConditionController = providers.Factory(
		AndConditionController,
		conditionRepository=conditionRepository
	)
	propertyInfoController: PropertyInfoController = providers.Factory(
		PropertyInfoController,
		propertyRepository=propertyRepository
	)
	conditionController: ConditionController = providers.Factory(
		ConditionController,
		conditionRepository=conditionRepository,
		controlRepository=controlRepository
	)
	controlController: ControlController = providers.Factory(
		ControlController,
		controlRepository=controlRepository
	)
	interfaceController: InterfaceController = providers.Factory(
		InterfaceController,
		interfaceRepository=interfaceRepository,
		interfaceService=interfaceService
	)
	functionController: FunctionController = providers.Factory(
		FunctionController,
		taskRepository=taskRepository,
		deviceRepository=deviceRepository
	)
	propertyController: PropertyController = providers.Factory(
		PropertyController,
		propertyRepository=propertyRepository,
		functionRepository=functionRepository
	)
	deviceController: DeviceController = providers.Factory(
		DeviceController,
		deviceRepository=deviceRepository,
		prefabRepository=prefabRepository
	)
	taskController: TaskController = providers.Factory(
		TaskController,
		taskRepository=taskRepository,
		controlRepository=controlRepository
	)
	groupController: GroupController = providers.Factory(
		GroupController,
		groupService=groupService
	)
