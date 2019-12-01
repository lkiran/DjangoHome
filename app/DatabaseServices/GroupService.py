import logging

from django.db.models import QuerySet

from app.BatchValueOperations import BatchValueOperations
from app.DatabaseServices.DeviceService import DeviceService
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.FunctionRepository import FunctionRepository
from app.Repositories.GroupRepository import GroupRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.models import GroupDevice, Function


class GroupService:
	DEFAULT_CALL_CLASS_NAME = "Group"

	__instance = None
	__logger = logging.getLogger('GroupService')
	__deviceRepository = DeviceRepository()
	__propertyRepository = PropertyRepository()
	__deviceService = DeviceService()
	__groupRepository= GroupRepository()
	__functionRepository= FunctionRepository()

	@staticmethod
	def Instance():
		if GroupService.__instance is None:
			GroupService()
		return GroupService.__instance

	def __init__(self):
		if GroupService.__instance is not None:
			raise Exception("GroupService is a singleton, use 'GroupService.Instance()'")
		else:
			self.__logger.info("Init")
			self._populateProducedGroups
			GroupService.__instance = self

	@property
	def _populateProducedGroups(self):
		return [d for d in DeviceService.Devices if d.CallClass is GroupService.DEFAULT_CALL_CLASS_NAME]

	def createGroup(self, group):
		group = self.__groupRepository.Save(group)
		functions = self._createGroupDeviceFunctions(group.Properties)
		groupDevice = GroupDevice()
		groupDevice.Name = group.Name
		groupDevice.Parameters = {}
		groupDevice.CallClass = "Group"
		groupDevice.Group = group
		groupDevice.save()
		groupDevice.Functions.add(*functions)
		return group

	def removeGroup(self):
		raise NotImplementedError()

	def addSubGroup(self, group):
		raise NotImplementedError()

	def removeSubGroup(self):
		raise NotImplementedError()

	def addProperty(self, property, group):
		hasCategory = group.Properties.filter(Category=property.Category).exists()
		group.Properties.append(property)
		group.save()
		if not hasCategory:
			functions = self._createGroupDeviceFunctions(QuerySet(property))
			group.Device.Functions += functions
			group.Device.save()  # TODO: use __groupDeviceService here
		return group

	def removeProperty(self, property, group):
		raise NotImplementedError()

	def notifyPropertyValueChange(self, property):
		raise NotImplementedError()

	def _createGroupDeviceFunctions(self, properties):
		categories = set(p.Category for p in properties.all())
		functions = []
		for category in categories:
			categoryProperties = properties.filter(Category=category)
			categoryGroupProperties = self._createGroupDeviceProperties(categoryProperties)
			function = Function()
			function.Name = category.Name
			function = self.__functionRepository.Save(function)
			for categoryGroupProperty in categoryGroupProperties:
				categoryGroupProperty = self.__propertyRepository.Save(categoryGroupProperty)
				function.Properties.add(categoryGroupProperty)
			self.__functionRepository.Save(function)
			functions.append(function)
		return functions

	def _createGroupDeviceProperties(self, categoryProperties):
		batchProperties = BatchValueOperations().convertToGroupProperty(categoryProperties)
		return batchProperties
