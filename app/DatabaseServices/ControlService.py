import logging


class ControlService(object):
	__instance = None
	__logger = logging.getLogger('ControlService')

	@staticmethod
	def Instance():
		if ControlService.__instance is None:
			ControlService()
		return ControlService.__instance

	def __init__(self):
		if ControlService.__instance is not None:
			raise Exception("ControlService is a singleton, use 'ControlService.Instance()'")
		ControlService.__instance = self