from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import PropertySerializer
from app.Repositories.FunctionRepository import FunctionRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum


class PropertyController(APIView):
	__propertyRepo = PropertyRepository()
	__functionRepo = FunctionRepository()

	def get(self, request, format=None):
		functionId = request.query_params.get("functionId")
		propertyId = request.query_params.get("propertyId")
		type = TypeEnum(int(request.query_params.get("type")))

		if not propertyId:
			properties = self.__functionRepo.GetProperties(functionId, type=type)
			result = PropertySerializer(properties, many=True)
		else:
			property = self.__propertyRepo.Get(propertyId)
			result = PropertySerializer(property)

		return Response(result.data)
