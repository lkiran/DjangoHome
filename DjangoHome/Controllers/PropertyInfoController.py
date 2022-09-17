from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import PropertyInfoSerializer
from DjangoHome import containers
from app.Repositories.PropertyRepository import PropertyRepository


class PropertyInfoController(APIView):
	__propertyRepo: PropertyRepository

	def initial(self, request, *args, **kwargs):
		super(PropertyInfoController, self).initial(request, *args, **kwargs)
		self.__propertyRepo = containers.containers.propertyRepository()

	def get(self, request, format=None):
		propertyId = request.query_params["propertyId"]

		propertyInfo = self.__propertyRepo.GetInfo(propertyId)

		result = PropertyInfoSerializer(propertyInfo)

		return Response(result.data)
