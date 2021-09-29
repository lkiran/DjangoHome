from dependency_injector.wiring import inject
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import BaseConditionSerializer

class AndConditionController(APIView):
	@inject
	def __init__(self, conditionRepository, **kwargs):
		super().__init__(**kwargs)
		self.__conditionRepo = conditionRepository

	def get(self, request, format=None):
		conditionId = request.query_params["conditionId"]
		condition = self.__conditionRepo.Get(conditionId)

		result = BaseConditionSerializer(data=condition.AndConditions.all(), many=True)
		result.is_valid()

		return Response(result.data)
