from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView
from app.ModelSerializers import TaskSerializer
from app.Repositories.ControlRepository import ControlRepository
from app.Repositories.TaskRepository import TaskRepository


class TaskController(APIView):
	__taskRepo = TaskRepository()
	__controlRepo = ControlRepository()

	def get(self, request, format=None):
		controlId = request.query_params["controlId"]
		control = self.__controlRepo.Get(controlId)
		if not control:
			return NotFound()

		result = TaskSerializer(data=control.Tasks.all(), many=True)
		result.is_valid()

		return Response(result.data)
