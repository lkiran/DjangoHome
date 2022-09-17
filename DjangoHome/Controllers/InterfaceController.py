from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import InterfaceSerializer
from DjangoHome import containers
from app.DatabaseServices.InterfaceService import InterfaceService
from app.Repositories.InterfaceRepository import InterfaceRepository


class InterfaceController(APIView):
	__interfaceRepo: InterfaceRepository
	__interfaceService: InterfaceService

	def initial(self, request, *args, **kwargs):
		super(InterfaceController, self).initial(request, *args, **kwargs)
		self.__interfaceRepo = containers.containers.interfaceRepository()
		self.__interfaceService = containers.containers.interfaceService()

	def get(self, request, format=None):
		interfaceId = request.query_params.get("interfaceId")
		interface = self.__interfaceRepo.Get(interfaceId)
		if not interfaceId:
			result = InterfaceSerializer(interface, many=True)
		else:
			result = InterfaceSerializer(interface)
		return Response(result.data)

	def post(self, request, format=None):
		interface = self.__interfaceRepo.Save(request.data)
		result = InterfaceSerializer(interface)
		return Response(result.data)

	def put(self, request, format=None):
		interfaceId = request.data.get("interfaceId")
		value = request.data.get("value")
		interface = self.__interfaceRepo.Get(interfaceId)
		result = self.__interfaceService.CallEditor(interface, value)
		return Response(data=result, status=status.HTTP_200_OK)
