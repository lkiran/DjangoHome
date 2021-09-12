from typing import Dict

import paho.mqtt.client as mqtt

from app.HardwareServices.BaseDeviceService import BaseDeviceService
from app.HardwareServices.BaseFunctionService import BaseFunctionService
from app.ValueTypes import Color


class Wallswitch(BaseDeviceService):

    def __init__(self, model):
        BaseDeviceService.__init__(self, model)
        self.client = mqtt.Client(client_id="HomeWallswitch")
        self.buttons: Dict[str, Button] = {}
        self._InstantiateUsingModel()

    def _InstantiateUsingModel(self):
        self.macAddress = self.Model.Parameters.get("macAddress", "")
        self.serverIp = self.Model.Parameters.get("serverIp", "localhost")
        self.serverPort = int(self.Model.Parameters.get("serverPort", "1883"))
        self.client.connect(self.serverIp, self.serverPort)
        self.client.loop_start()
        self.client.subscribe("{0}/start".format(self.macAddress))
        self.client.message_callback_add("{0}/start".format(self.macAddress), self.handleStart)

        for function in self.Model.Functions.all():
            properties = function.Properties.all()
            button = Button(self.macAddress, self.client, properties)
            self.buttons[button.id] = button

    def lightColor(self, **kwargs):
        button = self.buttons.get(kwargs.get("id"))
        if kwargs.get("Value", None):
            button.lightColor = kwargs.get("Value")
        return button.lightColor

    def status(self, **kwargs):
        id = kwargs.get("id")
        return None

    def handleStart(self, client, userdata, message):
        for button in self.buttons.values():
            button.initializeButton()


class Button(BaseFunctionService):

    def __init__(self, deviceId: str, client: mqtt.Client, properties):
        self.deviceId = deviceId
        self.client = client
        self.properties = properties
        self.lightColorProperty = properties.filter(CallFunction='lightColor').first()
        self.statusProperty = properties.filter(CallFunction='status').first()
        self.id = self.statusProperty.Parameters.get("id", None)
        self._lightColor = self.GetValue(self.lightColorProperty)
        self.initializeButton()
        self.client.subscribe("{0}/button/{1}".format(self.deviceId, self.id))
        self.client.message_callback_add("{0}/button/{1}".format(self.deviceId, self.id), self.handleStatus)

    def initializeButton(self):
        self.publishLightColor(self._lightColor)

    def publishLightColor(self, color: Color):
        self.client.publish("{0}/led/{1}".format(self.deviceId, self.id), color.toHex(withHashPrefix=False))

    @property
    def lightColor(self):
        return self._lightColor

    @lightColor.setter
    def lightColor(self, value: Color):
        self.publishLightColor(value)
        self.SetValue(self.lightColorProperty, value)

    def handleStatus(self, client, userdata, message):
        try:
            print("Received message '" + str(message.payload) + "' on topic '" + message.topic + "' with QoS " + str(
                message.qos))
            self.SetValue(self.statusProperty, message.payload.decode("utf-8"))
        except Exception as e:
            print("error ", e)
