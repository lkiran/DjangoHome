from rest_framework import serializers
from rest_framework.fields import SerializerMethodField

from app.models import *


class PropertySerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Property
		fields = '__all__'


class TaskSerializer(serializers.ModelSerializer):
	Property = PropertySerializer()
	Id = serializers.CharField()

	class Meta:
		model = Task
		fields = '__all__'


class ConditionSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()
	AndConditions = SerializerMethodField()

	class Meta:
		model = Condition
		fields = '__all__'

	def get_AndConditions(self, obj):
		if obj.AndConditions is not None:
			return ConditionSerializer(obj.AndConditions).data
		else:
			return None


class ControlSerializer(serializers.ModelSerializer):
	Tasks = TaskSerializer(required=False, many=True)
	Conditions = ConditionSerializer(required=False, many=True)
	Id = serializers.CharField()

	class Meta:
		model = Control
		fields = '__all__'


class FunctionSerializer(serializers.ModelSerializer):
	Id = serializers.CharField(required=False)

	class Meta:
		model = Function
		fields = '__all__'


class DeviceSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Device
		fields = '__all__'


class InterfaceSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Interface
		exclude = ('id',)