from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import BaseConditionSerializer


class ConditionController(APIView):
	def __init__(self, conditionRepository, controlRepository, **kwargs):
		super().__init__(**kwargs)
		self.__conditionRepo = conditionRepository
		self.__controlRepo = controlRepository

	def get(self, request, format=None):
		controlId = request.query_params["controlId"]
		control = self.__controlRepo.Get(controlId)

		result = BaseConditionSerializer(data=control.Conditions.all(), many=True)
		result.is_valid()

		return Response(result.data)
