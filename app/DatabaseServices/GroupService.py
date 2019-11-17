import logging

from app.BatchValueOperations import BatchValueOperations
from app.DatabaseServices.DeviceService import DeviceService
from app.Repositories.GroupRepository import GroupRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum
from app.models import GroupDevice, Function


class GroupService:
	DEFAULT_CALL_CLASS_NAME = "Group"

	__instance = None
	__logger = logging.getLogger('GroupService')
	__deviceRepository = GroupRepository()
	__propertyRepository = PropertyRepository()
	__deviceService = DeviceService()

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
			self._populateProducedGroups()
			GroupService.__instance = self

	@property
	def _populateProducedGroups(self):
		return DeviceService.Devices.filter(CallClass=GroupService.DEFAULT_CALL_CLASS_NAME)

	def createGroup(self, group):
		group.save()  # TODO: use _groupRepository instead
		functions = self._createGroupDeviceFunctions(group)
		groupDevice = GroupDevice()
		groupDevice.Name = group.Name
		groupDevice.CallClass = "Group"
		groupDevice.Functions = functions
		groupDevice.Group = group
		groupDevice.save()
		return group

	def removeGroup(self):
		raise NotImplementedError()

	def addSubGroup(self, group):
		raise NotImplementedError()

	def removeSubGroup(self):
		raise NotImplementedError()

	def addProperty(self, property, group):
		type = property.Type
		if type is TypeEnum.Read_Only:
			self._addReadOnlyPropertyToGroup(property, group)
		elif type is TypeEnum.Write_Only:
			self._addWriteOnlyPropertyToGroup(property, group)
		elif type is TypeEnum.Read_Or_Write:
			self._addReadOrWritePropertyToGroup(property, group)
		return group

	def removeProperty(self, property, group):
		raise NotImplementedError()

	def notifyPropertyValueChange(self, property):
		raise NotImplementedError()

	def _addReadOnlyPropertyToGroup(self, property, group):
		raise NotImplementedError()

	def _addWriteOnlyPropertyToGroup(self, property, group):
		raise NotImplementedError()

	def _addReadOrWritePropertyToGroup(self, property, group):
		self._addReadOnlyPropertyToGroup(property, group)
		self._addWriteOnlyPropertyToGroup(property, group)

	def _createGroupDeviceFunctions(self, group):
		categories = group.Properties.values_list("Category", flat=True).distinct()
		functions = []
		for category in categories:
			categoryProperties = group.Properties.filter(Category=category)
			categoryGroupProperties = self._createGroupDeviceProperties(categoryProperties)
			function = Function()
			function.Name = category.Name
			function.Properties = categoryGroupProperties
			function.save()  # TODO: use _functionRepository here
			functions.append(function)
		return functions

	def _createGroupDeviceProperties(self, categoryProperties):
		_class = categoryProperties.first().Class
		batchProperties = BatchValueOperations.convertToGroupProperty(categoryProperties)
		return batchProperties
