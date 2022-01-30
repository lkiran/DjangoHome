import abc


class Service(object):
	__metaclass__ = abc.ABCMeta

	def __init__(self, serviceBus):
		self.serviceBus = serviceBus
		self.register()

	@abc.abstractmethod
	def register(self):
		pass

	@abc.abstractmethod
	def handle(self, event: str, payload: tuple):
		pass
