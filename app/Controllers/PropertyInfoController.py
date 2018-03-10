from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import PropertyInfoSerializer
from app.Repositories.PropertyRepository import PropertyRepository


class PropertyInfoController(APIView):
	__propertyRepo = PropertyRepository()

	def get(self, request, format=None):
		propertyId = request.query_params["propertyId"]

		propertyInfo = self.__propertyRepo.GetInfo(propertyId)

		result = PropertyInfoSerializer(propertyInfo)

		return Response(result.data)
