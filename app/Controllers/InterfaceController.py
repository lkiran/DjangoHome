from rest_framework.views import APIView
from rest_framework.response import Response

from app.DatabaseServices.InterfaceService import InterfaceService
from app.ModelSerializers import InterfaceSerializer
from app.Repositories.InterfaceRepository import InterfaceRepository

class InterfaceController(APIView):
	__interfaceRepo = InterfaceRepository()
	__interfaceService= InterfaceService.Instance()

	def get(self, request, format=None):
		interfaceId = request.query_params.get("interfaceId")
		interface = self.__interfaceRepo.Get(interfaceId)
		if not interfaceId:
			result = InterfaceSerializer(interface, many=True)
		else:
			result = InterfaceSerializer(interface)
		return Response(result.data)

	def put(self, request, format=None):
		interfaceId = request.query_params.get("interfaceId")
		value = request.query_params.get("value")
		interface = self.__interfaceRepo.Get(interfaceId)
		result= self.__interfaceService.CallEditor(interface,value)
		return Response(result)
