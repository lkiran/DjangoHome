from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import PropertyInfoSerializer


class PropertyInfoController(APIView):
	def __init__(self, propertyRepository, **kwargs):
		super().__init__(**kwargs)
		self.__propertyRepo = propertyRepository

	def get(self, request, format=None):
		propertyId = request.query_params["propertyId"]

		propertyInfo = self.__propertyRepo.GetInfo(propertyId)

		result = PropertyInfoSerializer(propertyInfo)

		return Response(result.data)
