from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import FunctionSerializer, BaseFunctionSerializer
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.TaskRepository import TaskRepository


class FunctionController(APIView):
	__taskRepo = TaskRepository()
	__deviceRepo = DeviceRepository()

	def get(self, request, format=None):
		deviceId = request.query_params["deviceId"]
		device = self.__deviceRepo.Get(deviceId)
		if not device:
			return NotFound()

		functions = device.Functions.all()
		result = FunctionSerializer(functions, many=True)

		return Response(result.data)
