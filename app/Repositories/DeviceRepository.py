from app.Repositories.FunctionRepository import FunctionRepository
from app.enums import ModelStatus
from app.models import Device


class DeviceRepository:
	def __init__(self, functionRepository: FunctionRepository):
		self.__functionRepo = functionRepository

	def Get(self, id=None):
		if id is None:
			return Device.objects.all()
		try:
			return Device.objects.get(Id=id)
		except Device.DoesNotExist:
			return None

	def Save(self, data):
		model = Device()
		model.Id = data.get("Id", "")
		model.Name = data.get("Name", "")
		model.CallClass = data.get("CallClass", "")
		model.Parameters = data.get("Parameters", None)

		device = self.Get(model.Id)
		status = self.Status(model, device)
		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		Functions = data.get("Functions", None)
		for functionDict in Functions:
			function = self.__functionRepo.Save(functionDict)
			model.Functions.add(function.Id)

		return model

	def Status(self, model, device=None):
		if device is None:
			device = self.Get(model.Id)

		if not device:
			return ModelStatus.New

		if device.Name is model.Name:
			return ModelStatus.Modified

		return ModelStatus.Same
