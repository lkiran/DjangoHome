from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import BaseTaskSerializer
from DjangoHome import containers
from app.Repositories.ControlRepository import ControlRepository
from app.Repositories.TaskRepository import TaskRepository


class TaskController(APIView):
	__taskRepo: TaskRepository
	__controlRepo: ControlRepository

	def initial(self, request, *args, **kwargs):
		super(TaskController, self).initial(request, *args, **kwargs)
		self.__taskRepo = containers.containers.taskRepository()
		self.__controlRepo = containers.containers.controlRepository()

	def get(self, request, format=None):
		controlId = request.query_params.get("controlId")
		control = self.__controlRepo.Get(controlId)

		if control:
			result = BaseTaskSerializer(control.Tasks.all(), many=True)

		return Response(result.data)
