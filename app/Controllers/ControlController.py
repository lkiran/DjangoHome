from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import ControlSerializer, BaseControlSerializer


class ControlController(APIView):
	def __init__(self, controlRepository, **kwargs):
		super().__init__(**kwargs)
		self.__controlRepo = controlRepository

	def get(self, request, format=None):
		result = BaseControlSerializer(data=self.__controlRepo.Get(), many=True)
		result.is_valid()
		return Response(result.data)

	def post(self, request, format=None):
		control = self.__controlRepo.Save(request.data)
		result = ControlSerializer(control)
		return Response(result.data)
