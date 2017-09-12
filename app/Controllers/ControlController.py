from rest_framework.response import Response
from app.Repositories import ControlRepository
from rest_framework.views import APIView
from app.serializers import ControlSerializer

class ControlController(APIView):
	__controlRepo = ControlRepository.ControlRepository()

	def get(self, request, format=None):
		result = ControlSerializer(data=self.__controlRepo.Get(), many=True)
		result.is_valid();
		return Response(result.data)

