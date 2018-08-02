class ControlParser():
	def __init__(self, data):
		self.data = data

	def Tasks(self):
		return self.data.Produce("Tasks")

	def Conditions(self):
		return self.data.Produce("Conditions")


class ConditionParser():
	def __init__(self, data):
		self.data = data

	def AndConditions(self):
		return self.data.Produce("AndConditions")
