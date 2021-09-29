from dependency_injector.wiring import inject
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import DeviceSerializer, BaseDeviceSerializer


class DeviceController(APIView):
	@inject
	def __init__(self, deviceRepository, prefabRepository, **kwargs):
		super().__init__(**kwargs)
		self.__deviceRepo = deviceRepository
		self.__prefabRepo = prefabRepository

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
