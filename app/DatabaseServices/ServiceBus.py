import logging
from typing import List, Final, Dict

from app.DatabaseServices.Service import Service


class ServiceBus(object):
	__logger = logging.getLogger('ServiceBus')
	NOT_EXIST: Final[str] = "NOT_EXIST"

	def __init__(self):
		self.services: List[Service] = []
		self.events: Dict[str, Service] = {}

	def register(self, service: Service, event: str):
		self.events[event] = service
		self.__logger.debug("Registered '{0}' event by {1}. Total {2} events".format(event, service, len(self.events)))

	def get(self, event: str, payload: any):
		self.__logger.debug("Handling '{0}' event".format(event))
		return self.events[event].handle(event, payload)
