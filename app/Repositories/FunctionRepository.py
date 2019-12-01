from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import ModelStatus, TypeEnum
from app.models import Function


class FunctionRepository:
	__propertyRepo = PropertyRepository()

	def Get(self, id=None):
		if id is None:
			return Function.objects.all()
		try:
			return Function.objects.get(Id=id)
		except Function.DoesNotExist:
			return None

	def GetProperties(self, functionId=None, type=TypeEnum.Read_Or_Write):
		if functionId is None: return None

		function = self.Get(functionId)
		if not function: return None

		result = function.Properties.all()

		if type is not None and type is not TypeEnum.Read_Or_Write:
			if type is TypeEnum.Read_Only:
				return result.exclude(Type=TypeEnum.Write_Only)
			if type is TypeEnum.Write_Only:
				return result.exclude(Type=TypeEnum.Read_Only)
			return result.filter(Type=type)

		return result

	def Save(self, data):
		if type(data) is Function:
			model = data
		else:
			model = Function()
			model.Id = data.get("Id", "")
			model.Name = data.get("Name", "")

		function = self.Get(model.Id)
		status = self.Status(model, function)
		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		if type(data) is not Function:
			Properties = data['Properties']
			for propertyDict in Properties:
				property = self.__propertyRepo.Save(propertyDict)
				model.Properties.add(property.Id)

		return model

	def Status(self, model, function=None):
		if function == None:
			function = self.Get(model.Id)

		if not function:
			return ModelStatus.New

		if function.Name is model.Name:
			return ModelStatus.Modified

		return ModelStatus.Same
