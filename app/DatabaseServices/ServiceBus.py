from typing import List, Final, Dict

from app.DatabaseServices.Service import Service


class ServiceBus(object):
	NOT_EXIST: Final[str] = "NOT_EXIST"

	def __init__(self):
		self.services: List[Service] = []
		self.events: Dict[str, Service] = {}

	def register(self, service: Service, event: str):
		self.events[event] = service

	def get(self, event: str, payload: any):
		return self.events[event].handle(event, payload)
