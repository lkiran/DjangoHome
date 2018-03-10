from rest_framework import serializers
from rest_framework.fields import SerializerMethodField

from app.models import *


class PropertySerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Property
		fields = '__all__'


class PropertyInfoSerializer(serializers.ModelSerializer):
	FunctionId = serializers.CharField()
	FunctionName = serializers.CharField()
	DeviceId = serializers.CharField()
	DeviceName = serializers.CharField()

	class Meta:
		model = PropertyInfo
		fields = '__all__'


class TaskSerializer(serializers.ModelSerializer):
	Property = PropertySerializer()
	Id = serializers.CharField()

	class Meta:
		model = Task
		fields = '__all__'


class BaseTaskSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()
	PropertyId = serializers.CharField(source='Property_id')

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
		if obj.AndConditions.all() is not None:
			list = []
			for andCondition in obj.AndConditions.all():
				list.append(ConditionSerializer(andCondition).data)
			return list
		else:
			return None


class BaseConditionSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()
	PropertyId = serializers.CharField(source='Property_id')
	AndConditions = SerializerMethodField()

	class Meta:
		model = Condition
		exclude = ('Property',)

	def get_AndConditions(self, obj):
		return None


class ControlSerializer(serializers.ModelSerializer):
	Tasks = TaskSerializer(required=False, many=True)
	Conditions = ConditionSerializer(required=False, many=True)
	Id = serializers.CharField()

	class Meta:
		model = Control
		fields = '__all__'


class BaseControlSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Control
		fields = '__all__'


class FunctionSerializer(serializers.ModelSerializer):
	Id = serializers.CharField(required=False)
	Properties = PropertySerializer(required=False, many=True)

	class Meta:
		model = Function
		fields = '__all__'


class BaseFunctionSerializer(serializers.ModelSerializer):
	Id = serializers.CharField(required=False)
	Properties = SerializerMethodField()

	class Meta:
		model = Function
		fields = '__all__'

	def get_Properties(self, obj):
		return None


class DeviceSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Device
		fields = '__all__'


class BaseDeviceSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()
	Functions = SerializerMethodField()

	class Meta:
		model = Device
		fields = '__all__'

	def get_Functions(self, obj):
		return None


class InterfaceSerializer(serializers.ModelSerializer):
	Id = serializers.CharField()

	class Meta:
		model = Interface
		fields = '__all__'
