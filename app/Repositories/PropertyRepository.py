from app.enums import ModelStatus
from app.models import  Property


class PropertyRepository:
	def Get(self, id=None):
		if id is None:
			return Property.objects.all()
		try:
			return Property.objects.get(Id=id)
		except Property.DoesNotExist:
			return None

	def Save(self, data):
		model = Property()
		# TODO: Implement it
		status = self.Status(model)

		if status is ModelStatus.New:
			model.Id = None
			model.save()
		if status is ModelStatus.Modified:
			model.save()

		return model.Id

	def Status(self, model):
		# TODO: Implement it
		property = self.Get(model.Id)

		if not property:
			return ModelStatus.New

		return ModelStatus.Same
