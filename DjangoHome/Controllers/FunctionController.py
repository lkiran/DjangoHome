from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import FunctionSerializer
from DjangoHome import containers
from app.Repositories.DeviceRepository import DeviceRepository
from app.Repositories.TaskRepository import TaskRepository


class FunctionController(APIView):
	__taskRepo: TaskRepository
	__deviceRepo: DeviceRepository

	def initial(self, request, *args, **kwargs):
		super(FunctionController, self).initial(request, *args, **kwargs)
		self.__taskRepo = containers.containers.taskRepository()
		self.__deviceRepo = containers.containers.deviceRepository()

	def get(self, request, format=None):
		deviceId = request.query_params["deviceId"]
		device = self.__deviceRepo.Get(deviceId)
		if not device:
			return NotFound()

		functions = device.Functions.all()
		result = FunctionSerializer(functions, many=True)

		return Response(result.data)
