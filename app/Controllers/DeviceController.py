from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import DeviceSerializer, BaseDeviceSerializer
from app.Repositories import DeviceRepository, PrefabRepository


class DeviceController(APIView):
	__deviceRepo = DeviceRepository.DeviceRepository()
	__prefabRepo = PrefabRepository.PrefabRepository()


	def get(self, request, format=None):
		devices= self.__deviceRepo.Get()
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