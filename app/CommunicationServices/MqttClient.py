from paho.mqtt.client import Client


class MqttClient:

	def __init__(self, serverIp: str, serverPort: str, id: str):
		self.client: Client = Client(client_id=id)
		self.client.connect(serverIp, serverPort)
		self.client.loop_start()

	def subscribe(self, topic: str, callback):
		self.subscribe(topic, callback)

	def publish(self, topic: str, payload: any):
		self.publish(topic, payload)
