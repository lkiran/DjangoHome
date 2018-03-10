from app.models import Interface


class InterfaceRepository:
	def Get(self, id=None):
		if id is None:
			return Interface.objects.all()
		try:
			return Interface.objects.get(Id=id)
		except Interface.DoesNotExist:
			return None
