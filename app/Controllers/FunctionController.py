from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import FunctionSerializer


class FunctionController(APIView):
	def __init__(self, taskRepository, deviceRepository, **kwargs):
		super().__init__(**kwargs)
		self.__taskRepo = taskRepository
		self.__deviceRepo = deviceRepository

	def get(self, request, format=None):
		deviceId = request.query_params["deviceId"]
		device = self.__deviceRepo.Get(deviceId)
		if not device:
			return NotFound()

		functions = device.Functions.all()
		result = FunctionSerializer(functions, many=True)

		return Response(result.data)
