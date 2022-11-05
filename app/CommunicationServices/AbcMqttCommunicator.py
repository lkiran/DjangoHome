import abc

from app.CommunicationServices.MqttClient import MqttClient


class AbcMqttCommunicator(object):
	__metaclass__ = abc.ABCMeta

	@property
	def client(self) -> MqttClient:
		return self.client

	@client.setter
	def client(self, value: MqttClient) -> None:
		self.client = value
