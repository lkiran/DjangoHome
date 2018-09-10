from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import BaseConditionSerializer
from app.Repositories.ConditionRepository import ConditionRepository
from app.Repositories.ControlRepository import ControlRepository


class ConditionController(APIView):
	__conditionRepo = ConditionRepository()
	__controlRepo = ControlRepository()

	def get(self, request, format=None):
		controlId = request.query_params["controlId"]
		control = self.__controlRepo.Get(controlId)

		result = BaseConditionSerializer(data=control.Conditions.all(), many=True)
		result.is_valid()

		return Response(result.data)