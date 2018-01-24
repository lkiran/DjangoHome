from django.utils.six import BytesIO
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from rest_framework.views import APIView
from app.Repositories import DeviceRepository
from app.models import Device
from app.ModelSerializers import DeviceSerializer


class DeviceController(APIView):
	__deviceRepo = DeviceRepository.DeviceRepository()

	def get(self, request, format=None):
		result = DeviceSerializer(data=self.__deviceRepo.Get(), many=True)
		result.is_valid()
		return Response(result.data)

	def post(self, request, format=None):
		serializer = DeviceSerializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		device = serializer.save()

		device = self.__deviceRepo.Save(device)

		result = DeviceSerializer(device)
		return Response(result.data)