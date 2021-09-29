from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import BaseTaskSerializer


class TaskController(APIView):
	def __init__(self, taskRepository, controlRepository, **kwargs):
		super().__init__(**kwargs)
		self__taskRepo = taskRepository
		self__controlRepo = controlRepository

	def get(self, request, format=None):
		controlId = request.query_params.get("controlId")
		control = self.__controlRepo.Get(controlId)

		if control:
			result = BaseTaskSerializer(control.Tasks.all(), many=True)

		return Response(result.data)
