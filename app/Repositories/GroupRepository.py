from app.Repositories.FunctionRepository import FunctionRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import ModelStatus
from app.models import Device, Group


class GroupRepository(object):
	__propertyRepo = PropertyRepository()

	def Get(self, id=None):
		if id is None:
			return Group.objects.all()
		try:
			return Group.objects.get(Id=id)
		except Group.DoesNotExist:
			return None


	def Save(self, data):
		model = Group()
		model.Id = data.Id
		model.Name = data.Name

		group = self.Get(model.Id)
		status = self.Status(model, group)
		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		for property in  data.Properties.all():
			property = self.__propertyRepo.Get(property.Id)
			model.Properties.add(property)

		return model


	def Status(self, model, group=None):
		if group is None:
			group = self.Get(model.Id)

		if not group:
			return ModelStatus.New

		if group.Name is model.Name:
			return ModelStatus.Modified

		return ModelStatus.Same
