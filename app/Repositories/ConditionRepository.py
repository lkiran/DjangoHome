import collections

from app.enums import ModelStatus
from app.models import Condition


class ConditionRepository:
	def Get(self, id=None):
		if id is None:
			return Condition.objects.all()
		try:
			return Condition.objects.get(Id=id)
		except Condition.DoesNotExist:
			return None

	def Save(self, data):
		model = Condition()
		model.Id = data["Id"]
		model.Value = data["Value"]
		model.Property_id = data["PropertyId"]
		model.Operator = data["Operator"]

		andConditionList = data["AndConditions"]
		for conditionDict in andConditionList:
			andCondition = self.Save(conditionDict)
			model.AndConditions.add(andCondition.Id)

		status = self.Status(model)

		if status is ModelStatus.New:
			model.Id = None
			model.save()
		elif status is ModelStatus.Modified:
			model.save()

		print(str(model) + " " + model.Id)
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
