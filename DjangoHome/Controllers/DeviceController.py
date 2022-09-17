from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import DeviceSerializer, BaseDeviceSerializer
from DjangoHome import containers
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.PrefabRepository import PrefabRepository


class DeviceController(APIView):
	__deviceRepo: DeviceRepository
	__prefabRepo: PrefabRepository

	def initial(self, request, *args, **kwargs):
		super(DeviceController, self).initial(request, *args, **kwargs)
		self.__deviceRepo = containers.containers.deviceRepository()
		self.__prefabRepo = containers.containers.prefabRepository()

	def get(self, request, format=None):
		devices = self.__deviceRepo.Get()
		result = BaseDeviceSerializer(devices, many=True)

		return Response(result.data)

	def post(self, request, format=None):
		prefab = self.__prefabRepo.Get(request.data['id'])
		device = self.__deviceRepo.Save(prefab.Template)

		return Response(device.Id)

	def put(self, request, format=None):
		device = self.__deviceRepo.Save(request.data)

		result = DeviceSerializer(device)
		return Response(result.data)
