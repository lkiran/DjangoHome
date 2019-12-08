from app.BatchValueOperations import BatchValueOperations
from app.HardwareServices.BaseDeviceService import BaseDeviceService


class Group(BaseDeviceService):

	def __init__(self, model):
		BaseDeviceService.__init__(self, model)

	def execute(self, **kwargs):
		properties = self.Model.groupdevice.Group.Properties.all()
		operation = kwargs.get("operation", None)
		value = kwargs.get("Value", None)
		batchProperties = BatchValueOperations().evaluateProperties(properties, operation, value)
		return value
