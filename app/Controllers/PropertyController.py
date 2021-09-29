from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import PropertySerializer
from app.enums import TypeEnum


class PropertyController(APIView):
	def __init__(self, propertyRepository, functionRepository, **kwargs):
		super().__init__(**kwargs)
		self.__propertyRepo = propertyRepository
		self.__functionRepo = functionRepository

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
