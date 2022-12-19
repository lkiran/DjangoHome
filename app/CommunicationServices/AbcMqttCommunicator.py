import abc
from typing import Optional

from app.CommunicationServices.MqttClient import MqttClient


class AbcMqttCommunicator(object):
    __metaclass__ = abc.ABCMeta

    def __init__(self, mqttClient: MqttClient):
        self._client: Optional[MqttClient] = mqttClient

    @property
    def client(self) -> MqttClient:
        return self._client
