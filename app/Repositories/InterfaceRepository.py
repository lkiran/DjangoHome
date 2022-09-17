import logging
from typing import List

from app.enums import ModelStatus
from app.models import Interface


class InterfaceRepository:
	def __init__(self):
		self.__logger = logging.getLogger('InterfaceRepository')

	def Get(self, id=None):
		if id is None:
			return list(Interface.objects.all())
		try:
			return Interface.objects.get(Id=id)
		except Interface.DoesNotExist:
			return None


	def Save(self, data):
		model = Interface()
		model.Id = data.get("Id", u'')
		model.Name = data.get("Name", u'')
		model.Monitor_id = data.get("Monitor", u'')
		model.Editor_id = data.get("Editor", u'')

		interface = self.Get(model.Id)
		status = self.Status(model, interface)
		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		return model


	def Status(self, model, interface=None):
		if interface is None:
			interface = self.Get(model.Id)

		if not interface:
			return ModelStatus.New

		if interface.Name is model.Name:
			return ModelStatus.Modified
		if interface.Monitor_id is model.Monitor_id:
			return ModelStatus.Modified
		if interface.Editor_id is model.Editor_id:
			return ModelStatus.Modified

		return ModelStatus.Same