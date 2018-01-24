from rest_framework.response import Response
from app.ModelSerializers import InterfaceSerializer
from app.Repositories import InterfaceRepository
from rest_framework.views import APIView


class InterfaceController(APIView):
    __interfaceRepo = InterfaceRepository()

    def get(self, request, format=None):
        result = InterfaceSerializer(data=self.__interfaceRepo.Get(), many=True)
        return Response(result.data)

