import string

from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import ModelStatus
from app.models import Task


class TaskRepository:
	__propertyRepo = PropertyRepository()

	def Get(self, id=None):
		if id is None:
			return Task.objects.all()
		try:
			return Task.objects.get(Id=id)
		except Task.DoesNotExist:
			return None

	def Save(self, data):
		model = Task()
		model.Id = data["Id"]
		model.Value = data["Value"]
		model.Property_id = data["PropertyId"]

		status = self.Status(model)

		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		print(str(model) + " " + model.Id)
		return model

	def Status(self, model):
		task = self.Get(model.Id)

		if not task:
			return ModelStatus.New

		if task.Value != model.Value:
			return ModelStatus.Modified
		if task.Property_id != model.Property_id:
			return ModelStatus.Modified

		return ModelStatus.Same
