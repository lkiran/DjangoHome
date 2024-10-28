import logging
from typing import Dict

from app.CommunicationServices.AbcMqttCommunicator import AbcMqttCommunicator
from app.CommunicationServices.MqttClient import MqttClient
from app.DatabaseServices.ServiceBus import ServiceBus
from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.ValueTypes import Color
from app.models import Property, Device


class Wallswitch(BaseDeviceService, AbcMqttCommunicator):

	def __init__(self, model: Device, serviceBus: ServiceBus, mqttClient: MqttClient):
		BaseDeviceService.__init__(self, model, serviceBus)
		AbcMqttCommunicator.__init__(self, mqttClient)
		self.__logger = logging.getLogger('Wallswitch({0})'.format(model.Id))
		self.buttons: Dict[str, Button] = {}
		self.thermometer: Thermometer
		self._InstantiateUsingModel()

	def _InstantiateUsingModel(self):
		self.macAddress = self.Model.Parameters.get("macAddress", "")
		self.client.subscribe("{0}/start".format(self.macAddress), self.handleStart)

		for function in self.Model.Functions.all():
			properties = function.Properties.all()
			if any(p.CallFunction == "celcius" for p in properties):
				self.thermometer = Thermometer(self.macAddress, self, properties)
			else:
				button = Button(self.macAddress, self, properties)
				self.buttons[button.id] = button

	def lightColor(self, **kwargs):
		button = self.buttons.get(kwargs.get("id"))
		if kwargs.get("Value", None):
			button.lightColor = kwargs.get("Value")
		return button.lightColor

	def status(self, **kwargs):
		id = kwargs.get("id")
		return None

	def celcius(self, **kwargs):
		return self.thermometer.celcius

	def handleStart(self, client, userdata, message):
		for button in self.buttons.values():
			button.initializeButton()


class Thermometer(object):
	def __init__(self, deviceId: str, device: Wallswitch, properties):
		self.deviceId = deviceId
		self.device = device
		self.properties = properties
		self.__logger = logging.getLogger('Wallswitch({0}).Thermometer'.format(device.Model.Id))
		self.celciusProperty = properties.filter(CallFunction='celcius').first()
		self._celcius = self.celciusProperty.Object
		self.device.client.subscribe("{0}/temperature".format(self.deviceId), self.handleTemperature)

	@property
	def celcius(self):
		return self._celcius

	def handleTemperature(self, client, userdata, message):
		try:
			self.__logger.info(
				"Received message '" + str(message.payload) + "' on topic '" + message.topic + "' with QoS " + str(
					message.qos))
			self._celcius = message.payload.decode("utf-8")
			self.device.SetValue(self.celciusProperty, self._celcius)
		except Exception as e:
			self.__logger.error("Error on message handling", e)


class Button(object):
	def __init__(self, deviceId: str, device: Wallswitch, properties):
		self.deviceId = deviceId
		self.device = device
		self.properties = properties
		self.lightColorProperty: Property = properties.filter(CallFunction='lightColor').first()
		self.statusProperty = properties.filter(CallFunction='status').first()
		self.id = self.statusProperty.Parameters.get("id", None)
		self.__logger = logging.getLogger('Wallswitch({0}).Button({1})'.format(device.Model.Id, self.id))
		self._lightColor = self.lightColorProperty.Object
		self.initializeButton()
		self.device.client.subscribe("{0}/button/{1}".format(self.deviceId, self.id), self.handleStatus)

	def initializeButton(self):
		self.publishLightColor(self._lightColor)

	def publishLightColor(self, color: Color):
		self.device.client.publish("{0}/led/{1}".format(self.deviceId, self.id), color.toHex(withHashPrefix=False))

	@property
	def lightColor(self):
		return self._lightColor

	@lightColor.setter
	def lightColor(self, value: Color):
		self.publishLightColor(value)
		self.device.SetValue(self.lightColorProperty, value)

	def handleStatus(self, client, userdata, message):
		try:
			self.__logger.info(
				"Received message '" + str(message.payload) + "' on topic '" + message.topic + "' with QoS " + str(
					message.qos))
			self.device.SetValue(self.statusProperty, message.payload.decode("utf-8"))
		except Exception as e:
			self.__logger.error("Error on message handling", e)
