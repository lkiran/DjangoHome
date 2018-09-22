class LiveCondition(object):

	def __init__(self, model):
		self.Model = model
		self._status = False

	@property
	def Status(self):
		return

	def UpdateStatus(self, value):
		otherValue = self.Model.Property.Object
		operator = self.Model.Operator
