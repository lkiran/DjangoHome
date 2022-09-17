from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import ControlSerializer, BaseControlSerializer
from DjangoHome import containers
from app.Repositories.ControlRepository import ControlRepository


class ControlController(APIView):
	__controlRepo = ControlRepository

	def initial(self, request, *args, **kwargs):
		super(ControlController, self).initial(request, *args, **kwargs)
		self.__controlRepo = containers.containers.controlRepository()

	def get(self, request, format=None):
		result = BaseControlSerializer(data=self.__controlRepo.Get(), many=True)
		result.is_valid()
		return Response(result.data)

	def post(self, request, format=None):
		control = self.__controlRepo.Save(request.data)
		result = ControlSerializer(control)
		return Response(result.data)
