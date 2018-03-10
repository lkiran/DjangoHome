from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import DeviceSerializer, BaseDeviceSerializer
from app.Repositories import DeviceRepository


class DeviceController(APIView):
	__deviceRepo = DeviceRepository.DeviceRepository()

	def get(self, request, format=None):
		devices= self.__deviceRepo.Get()
		result = BaseDeviceSerializer(devices, many=True)

		return Response(result.data)


	def post(self, request, format=None):
		device = self.__deviceRepo.Save(request.data)

		result = DeviceSerializer(device)
		return Response(result.data)