import shortuuid
from django.db.models.aggregates import Count

from app.enums import ModelStatus, ComparerEnum
from app.models import Condition


class ConditionRepository:
	def Get(self, id=None):
		if id is None:
			return Condition.objects\
				.annotate(AndConditionCount=Count('AndConditions'))\
				.order_by('-AndConditionCount')\
				.all()  #Get top conditions at beginning of list
		try:
			return Condition.objects.get(Id=id)
		except Condition.DoesNotExist:
			return None

	def GetAllByProperty(self, property):
		if property:
			return Condition.objects\
				.filter(Property_id=property.Id)\
				.annotate(AndConditionCount=Count('AndConditions'))\
				.order_by('-AndConditionCount')\
				.all()  #Get top conditions at beginning of list
		return None

	def GetAndConditions(self, condition):
		if condition:
			return condition.AndConditions\
				.annotate(AndConditionCount=Count('AndConditions'))\
				.order_by('-AndConditionCount')\
				.all()  #Get top conditions at beginning of list
		return None

	def GetParentConditions(self, condition):
		if condition:
			return Condition.objects\
				.filter(Condit=condition.Id)\
				.all()  #Get top conditions at beginning of list
		return None

	def Save(self, data):
		model = Condition()
		model.Id = data.get('Id', u'')
		model.Value = data.get('Value', u'')
		model.Property_id = data.get('PropertyId', u'')
		model.Operator = data.get('Operator', u'')
		if model.Operator == u'':
			model.Operator = u'0'
		andConditionList = data.get('AndConditions', u'')
		for conditionDict in andConditionList:
			andCondition = self.Save(conditionDict)
			model.AndConditions.add(andCondition.Id)

		status = self.Status(model)

		if status is ModelStatus.New:
			model.save()
			print(u"{0} condition is created".format(model))

		elif status is ModelStatus.Modified:
			model.save()
			print(u"{0} condition is updated".format(model))

		return model

	def Status(self, model):
		condition = self.Get(model.Id)

		if not condition:
			return ModelStatus.New

		if condition.Value != model.Value:
			return ModelStatus.Modified
		if condition.Property_id != model.Property_id:
			return ModelStatus.Modified
		if condition.Operator != int(model.Operator):
			return ModelStatus.Modified
		# if collections.Counter(condition.AndConditions) != collections.Counter(model.AndConditions)
		# 	return ModelStatus.Modified
		return ModelStatus.Same
