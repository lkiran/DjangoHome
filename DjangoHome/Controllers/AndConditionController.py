from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import BaseConditionSerializer
from DjangoHome import containers
from app.Repositories.ConditionRepository import ConditionRepository


class AndConditionController(APIView):
	__conditionRepo: ConditionRepository

	def initial(self, request, *args, **kwargs):
		super(AndConditionController, self).initial(request, *args, **kwargs)
		self.__conditionRepo = containers.containers.conditionRepository()

	def get(self, request, format=None):
		conditionId = request.query_params["conditionId"]
		condition = self.__conditionRepo.Get(conditionId)

		result = BaseConditionSerializer(data=condition.AndConditions.all(), many=True)
		result.is_valid()

		return Response(result.data)
