import shortuuid
from django.db import models

from app.enums import TypeEnum, ClassEnum, ComparerEnum


class Property(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Name = models.CharField(max_length=50)
	Value = models.CharField(max_length=50)
	Type = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in TypeEnum])
	Class = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in ClassEnum])
	Comparable = models.BooleanField(default=True)

	def __str__(self):
		return '{0} ({1})'.format(self.Name, self.Id)


class Function(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Name = models.CharField(max_length=50)
	Properties = models.ManyToManyField(Property, blank=True)

	def __str__(self):
		return '{0} ({1})'.format(self.Name, self.Id)


class Device(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Name = models.CharField(max_length=50)
	Functions = models.ManyToManyField(Function, blank=True)

	def __str__(self):
		return self.Name

	def save(self, *args, **kwargs):
		if self.Id is not "": return

		self.Id = shortuuid.random(10)
		super(Device, self).save(*args, **kwargs)


class Task(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Property = models.ForeignKey(Property, blank=True)
	Value = models.CharField(max_length=50)

	def __str__(self):
		return 'Set ' + self.Property.Name + ' to ' + self.Value


class Condition(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Property = models.ForeignKey(Property, blank=True)
	Operator = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in ComparerEnum])
	Value = models.CharField(max_length=50)
	AndConditions = models.ManyToManyField("self", blank=True, symmetrical=False)

	def __str__(self):
		return "When " + self.Property.Name + ' -> ' + self.Value


class Control(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Name = models.CharField(max_length=50)
	Tasks = models.ManyToManyField(Task, blank=True)
	Conditions = models.ManyToManyField(Condition, blank=True)

	def __str__(self):
		return "Task " + self.Name


class Interface(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Name = models.CharField(max_length=50)
	Editor = models.ForeignKey(Property, null=True, related_name="editor")
	Monitor = models.ForeignKey(Property, null=True)

	def __str__(self):
		return "Interface " + self.Name


class Prefab(models.Model):
	Id = models.CharField(max_length=10, primary_key=True, editable=False, default=shortuuid.random(10))
	Name = models.CharField(max_length=50)
	Template = models.CharField(max_length=5000)

	def __str__(self):
		return self.Name


class PropertyInfo(Property):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		self.FunctionId = ""
		self.FunctionName = ""
		self.DeviceId = ""
		self.DeviceName = ""
