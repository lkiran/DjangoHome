import logging

from app.DatabaseServices.ServiceBus import ServiceBus
from app.HardwareServices.BaseFunctionService import BaseFunctionService
from app.models import Device


class BaseDeviceService(BaseFunctionService):  # TODO: Should not be inherited from BaseFunctionService

	def __init__(self, model, serviceBus: ServiceBus):
		BaseFunctionService.__init__(self, serviceBus)
		if type(model) is not Device:
			raise Exception("Device model should be passed to constructor")
		self.Model = model
		self.__logger = logging.getLogger(model.Name)

	def __str__(self):
		return u"{0}".format(self.Model)