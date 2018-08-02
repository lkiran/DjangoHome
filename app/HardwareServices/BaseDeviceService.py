import logging

from app.models import Device


class BaseClassService(object):
	def __init__(self, model):
		if type(model) is not Device:
			raise Exception("Device model should be passed to constructor")
		self.Model = model
		self.__logger=logging.getLogger(model.Name)

	def __str__(self):
		return u"{0}".format(self.Model)