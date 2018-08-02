from app.models import Prefab

class PrefabRepository:
	def __init__(self):
		pass

	def Get(self, id=None):
		if id is None:
			return Prefab.objects.all()
		try:
			return Prefab.objects.get(Id=id)
		except Prefab.DoesNotExist:
			return None