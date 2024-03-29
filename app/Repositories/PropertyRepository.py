from app.enums import ModelStatus
from app.models import Property, PropertyInfo


class PropertyRepository:
	def __init__(self):
		pass

	def Get(self, id=None):
		if id is not None:
			try:
				return Property.objects.get(Id=id)
			except Property.DoesNotExist:
				return None

	def GetInfo(self, propertyId):
		propertyInfo = PropertyInfo()

		property = self.Get(id=propertyId)
		function = property.function_set.first()
		device = function.device_set.first()

		propertyInfo.Id = property.Id
		propertyInfo.Name = property.Name
		propertyInfo.Value = property.Value
		propertyInfo.Type = property.Type
		propertyInfo.Class = property.Class
		propertyInfo.Comparable = property.Comparable
		propertyInfo.CallFunction = property.CallFunction

		propertyInfo.FunctionId = function.Id
		propertyInfo.FunctionName = function.Name

		propertyInfo.DeviceId = device.Id
		propertyInfo.DeviceName = device.Name

		return propertyInfo

	def Save(self, data):
		if type(data) is Property:
			model = data
		else:
			model = Property()
			model.Id = data.get("Id", "")
			model.Name = data['Name']
			model.Value = data['Value']
			model.Type = data['Type']
			model.Class = data['Class']
			model.Comparable = data['Comparable']
			model.CallFunction = data.get("CallFunction", "")
			model.Parameters = data.get("Parameters", None)

		status = self.Status(model)

		if status is ModelStatus.New:
			model.Id = None
			model.save()
		if status is ModelStatus.Modified:
			model.save()

		return model

	def UpdateValue(self, data):
		id = data.get("Id", None)
		value = data['Value']

		property = self.Get(id)
		if property.Value != value:
			property.Value = value
			property.save()

		return property

	def Status(self, model, property=None):
		if property == None:
			property = self.Get(model.Id)

		if not property:
			return ModelStatus.New

		if property.Name is model.Name:
			return ModelStatus.Modified

		if property.Value is model.Value:
			return ModelStatus.Modified

		if property.Type != int(model.Type):
			return ModelStatus.Modified

		if property.Class != int(model.Class):
			return ModelStatus.Modified

		if property.Comparable is model.Comparable:  # TODO: Is correct comparing?
			return ModelStatus.Modified

		return ModelStatus.Same
