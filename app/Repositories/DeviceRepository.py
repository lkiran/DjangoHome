from app.Repositories.FunctionRepository import FunctionRepository
from app.enums import ModelStatus
from app.models import Device


class DeviceRepository:
	__functionRepo = FunctionRepository()

	def Get(self, id=None):
		if id is None:
			return Device.objects.all()
		try:
			return Device.objects.get(Id=id)
		except Device.DoesNotExist:
			return None

	def Save(self, data):
		model = Device()
		model.Id = data['Id']
		model.Name = data['Name']

		Functions = data['Functions']
		for functionDict in Functions:
			function = self.__functionRepo.Save(functionDict)
			model.Functions.add(function.Id)

		device = self.Get(model.Id)
		status = self.Status(model, device)
		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		print(str(model) + " " + model.Id)

		return model

	def Status(self, model, device=None):
		if device == None:
			device = self.Get(model.Id)

		if not device:
			return ModelStatus.New

		if device.Name is model.Name:
			return ModelStatus.Modified

		return ModelStatus.Same
