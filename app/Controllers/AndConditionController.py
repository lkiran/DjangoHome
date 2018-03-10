from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import ConditionSerializer, BaseConditionSerializer
from app.Repositories.ConditionRepository import ConditionRepository


class AndConditionController(APIView):
	__conditionRepo = ConditionRepository()

	def get(self, request, format=None):
		conditionId = request.query_params["conditionId"]
		condition = self.__conditionRepo.Get(conditionId)

		result = BaseConditionSerializer(data=condition.AndConditions.all(), many=True)
		result.is_valid()

		return Response(result.data)
