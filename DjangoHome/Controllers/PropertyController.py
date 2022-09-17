from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import PropertySerializer
from DjangoHome import containers
from app.Repositories.FunctionRepository import FunctionRepository
from app.Repositories.PropertyRepository import PropertyRepository
from app.enums import TypeEnum


class PropertyController(APIView):
	__propertyRepo: PropertyRepository
	__functionRepo: FunctionRepository

	def initial(self, request, *args, **kwargs):
		super(PropertyController, self).initial(request, *args, **kwargs)
		self.__propertyRepo = containers.containers.propertyRepository()
		self.__functionRepo = containers.containers.functionRepository()

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
