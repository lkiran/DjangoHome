from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import NotFound

from app.ModelSerializers import InterfaceSerializer
from app.Repositories.InterfaceRepository import InterfaceRepository


class InterfaceController(APIView):
	__interfaceRepo = InterfaceRepository()

	def get(self, request, format=None):
		interfaceId = request.query_params.get("interfaceId")
		interface = self.__interfaceRepo.Get(interfaceId)

		if not interfaceId:
			result = InterfaceSerializer(interface, many=True)
		else:
			result = InterfaceSerializer(interface)

		return Response(result.data)
