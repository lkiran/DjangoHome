from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from app.ModelSerializers import GroupSerializer


class GroupController(APIView):
	def __init__(self, groupService, **kwargs):
		super().__init__(**kwargs)
		self.__groupService = groupService

	def post(self, request, format=None):
		serializer = GroupSerializer(data=request.data)
		if not serializer.is_valid():
			return Response(status=status.HTTP_400_BAD_REQUEST, data=serializer.errors)
		group = serializer.create()
		group = self.__groupService.createGroup(group)
		result = GroupSerializer(group)
		return Response(result.data)
