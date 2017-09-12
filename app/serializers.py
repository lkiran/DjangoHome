from rest_framework import serializers
from app.models import *


class PropertySerializer(serializers.ModelSerializer):
    Id = serializers.IntegerField(source='id')

    class Meta:
        model = Property
        exclude = ('id',)


class TaskSerializer(serializers.ModelSerializer):
    Property = PropertySerializer()
    Id = serializers.IntegerField(source='id')

    class Meta:
        model = Task
        exclude = ('id',)


class ConditionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Condition
        exclude = ('id',)


class ControlSerializer(serializers.ModelSerializer):
    Tasks = TaskSerializer(many=True)
    Conditions = ConditionSerializer(many=True)
    Id = serializers.IntegerField(source='id')

    class Meta:
        model = Control
        exclude = ('id',)


class FunctionSerializer(serializers.ModelSerializer):
    Id = serializers.IntegerField(source='id')

    class Meta:
        model = Function
        exclude = ('id',)

    Properties = PropertySerializer()


class DeviceSerializer(serializers.ModelSerializer):
    Id = serializers.IntegerField(source='id')

    class Meta:
        model = Device
        exclude = ('id',)


class InterfaceSerializer(serializers.ModelSerializer):
    Id = serializers.IntegerField(source='id')

    class Meta:
        model = Interface
        exclude = ('id',)
