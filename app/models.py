import uuid

from django.db import models
from django.forms import IntegerField

from app.enums import TypeEnum, ClassEnum, ComparerEnum


class Property(models.Model):
    Name = models.CharField(max_length=50)
    Value = models.CharField(max_length=50)
    Type = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in TypeEnum])
    Class = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in ClassEnum])
    Comparable = models.BooleanField(default=True)

    def __str__(self):
        return self.Name


class Function(models.Model):
    Name = models.CharField(max_length=50)
    Properties = models.ManyToManyField(Property, blank=True)

    def __str__(self):
        return self.Name


class Device(models.Model):
    Name = models.CharField(max_length=50)
    Functions = models.ManyToManyField(Function, blank=True)

    def __str__(self):
        return self.Name


class Task(models.Model):
    Property = models.ForeignKey(Property)
    Value = models.CharField(max_length=50)

    def __str__(self):
        return 'Set ' + self.Property.Name + ' to ' + self.Value


class Condition(models.Model):
    Property = models.ForeignKey(Property)
    Operator = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in ComparerEnum])
    Value = models.CharField(max_length=50)
    AndConditions = models.ManyToManyField("self", blank=True)

    def __str__(self):
        return "When " + self.Property.Name + ' -> ' + self.Value


class Control(models.Model):
    Name = models.CharField(max_length=50)
    Tasks = models.ManyToManyField(Task)
    Conditions = models.ManyToManyField(Condition)

    def __str__(self):
        return self.Name


class Interface(models.Model):
    Name = models.CharField(max_length=50)
    Editor = models.ForeignKey(Property, null=True, related_name="editor")
    Monitor = models.ForeignKey(Property, null=True)

    def __str__(self):
        return self.Name


class PropertyInfo(Property):
    FunctionId = ""
    FunctionName = ""
    DeviceId = ""
    DeviceName = ""
