import string

import shortuuid

from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import ModelStatus
from app.models import Task


class TaskRepository:
	def __init__(self, propertyRepository: PropertyRepository):
		self.__propertyRepo = propertyRepository

	def Get(self, id=None):
		if id is None:
			return Task.objects.all()
		try:
			return Task.objects.get(Id=id)
		except Task.DoesNotExist:
			return None

	def Save(self, data):
		model = Task()
		model.Id = data.get('Id', u'')
		model.Property_id = data.get("PropertyId", u'')
		model.Value = data.get('Value', u'')

		status = self.Status(model)

		if status is ModelStatus.New:
			model.save()
			print("{0} is Created".format(model))
		elif status is ModelStatus.Modified:
			model.save()
			print("{0} is Updated".format(model))

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
