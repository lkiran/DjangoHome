from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from DjangoHome.Controllers.ModelSerializers import GroupSerializer
from DjangoHome import containers
from app.DatabaseServices.GroupService import GroupService


class GroupController(APIView):
	__groupService: GroupService

	def initial(self, request, *args, **kwargs):
		super(GroupController, self).initial(request, *args, **kwargs)
		self.__groupService = containers.containers.groupService()

	def post(self, request, format=None):
		serializer = GroupSerializer(data=request.data)
		if not serializer.is_valid():
			return Response(status=status.HTTP_400_BAD_REQUEST, data=serializer.errors)
		group = serializer.create()
		group = self.__groupService.createGroup(group)
		result = GroupSerializer(group)
		return Response(result.data)
