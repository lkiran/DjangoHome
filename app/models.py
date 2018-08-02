from django.db import models
import jsonfield as jsonfield
from shortuuidfield import ShortUUIDField

from app.ValueParser import ValueParser
from app.enums import TypeEnum, ClassEnum, ComparerEnum


class Property(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Name = models.CharField(max_length=50)
	CallFunction = models.CharField(max_length=50)
	Parameters = jsonfield.JSONField(default="{}")
	Value = models.CharField(max_length=50)
	Type = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in TypeEnum])
	Class = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in ClassEnum])
	Comparable = models.BooleanField(default=True)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	_Parser = None

	@property
	def Parser(self):
		if not self._Parser:
			self._Parser = ValueParser().Get(ClassEnum(self.Class))
		return self._Parser

	@property
	def Object(self):
		return self.Parser.ToObject(self.Value)

	@Object.setter
	def Object(self, object):
		self.Value = self.Parser.ToString(object)
		self.save()
		print("Property value is updated in database")

	@property
	def Device(self):
		return Device.objects.filter(Functions__Properties=self).first()

	def __str__(self):
		return u'{0} ({1})'.format(unicode(self.Name), self.Id)

	def __unicode__(self):
		return u'{0} ({1})'.format(unicode(self.Name), self.Id)


class Function(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Name = models.CharField(max_length=50)
	Properties = models.ManyToManyField(Property, blank=True)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	def __str__(self):
		return u'{0} ({1})'.format(unicode(self.Name), self.Id)

	def __unicode__(self):
		return u'{0} ({1})'.format(unicode(self.Name), self.Id)


class Device(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Name = models.CharField(max_length=50)
	CallClass = models.CharField(max_length=50)
	Parameters = jsonfield.JSONField(default="{}")
	Functions = models.ManyToManyField(Function, blank=True)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	@property
	def Properties(self):
		return Property.objects.filter(function__device=self)

	def __str__(self):
		return u'{0} ({1})'.format(unicode(self.Name), self.Id)

	def __unicode__(self):
		return u'{0} ({1})'.format(unicode(self.Name), self.Id)


class Task(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Property = models.ForeignKey(Property, blank=True)
	Value = models.CharField(max_length=50)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	def __str__(self):
		return 'Set ' + unicode(self.Property.Name) + ' to ' + self.Value

	def __unicode__(self):
		return 'Set ' + unicode(self.Property.Name) + ' to ' + self.Value


class Condition(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Property = models.ForeignKey(Property, blank=True)
	Operator = models.IntegerField(choices=[(choice.value, choice.name.replace("_", " ")) for choice in ComparerEnum])
	Value = models.CharField(max_length=50)
	AndConditions = models.ManyToManyField("self", blank=True, symmetrical=False)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	def __str__(self):
		return "When " + unicode(self.Property.Name) + ' -> ' + self.Value

	def __unicode__(self):
		return "When " + unicode(self.Property.Name) + ' -> ' + self.Value


class Control(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Name = models.CharField(max_length=50)
	Tasks = models.ManyToManyField(Task, blank=True)
	Conditions = models.ManyToManyField(Condition, blank=True)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	def __str__(self):
		return "Task " + unicode(self.Name)

	def __unicode__(self):
		return "Task " + unicode(self.Name)


class Interface(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Name = models.CharField(max_length=50)
	Editor = models.ForeignKey(Property, null=True, related_name="editor")
	Monitor = models.ForeignKey(Property, null=True)
	CreatedOn = models.DateTimeField(auto_now_add=True)
	ModifiedOn = models.DateTimeField(auto_now=True)

	def __str__(self):
		return "Interface " + unicode(self.Name)

	def __unicode__(self):
		return "Interface " + unicode(self.Name)


class Prefab(models.Model):
	Id = ShortUUIDField(unique=True, primary_key=True, blank=False, editable=False)
	Name = models.CharField(max_length=50)
	Template = jsonfield.JSONField(default="{}")

	def __str__(self):
		return unicode(self.Name)

	def __unicode__(self):
		return unicode(self.Name)


class PropertyInfo(Property):
	def __init__(self, *args, **kwargs):
		super(PropertyInfo, self).__init__()
		self.FunctionId = ""
		self.FunctionName = ""
		self.DeviceId = ""
		self.DeviceName = ""


class DeviceProperty:
	def __init__(self, value, templateClass):
		self._Value = None
		self._Parser = ValueParser().Get(templateClass)
		self.Value = value

	@property
	def Value(self):
		return self._Parser.ToObject(self._Value)

	@Value.setter
	def Value(self, value):
		self._Value = self._Parser.ToString(value)
