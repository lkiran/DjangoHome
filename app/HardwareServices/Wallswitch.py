import threading
import time

from enum import Enum

# from app.CommunicationServices.TwoWireInterface import TwoWireInterface
from app.HardwareServices.BaseDeviceService import BaseDeviceService


class Wallswitch(BaseDeviceService):
	__i2c = None #TwoWireInterface.Instance()

	def __init__(self, model):
		BaseDeviceService.__init__(self, model)
		self.Address = 0
		self.Buttons = []
		self._InstantiateUsingModel()
		self.__controlThread = None

	def _InstantiateUsingModel(self):
		self.Address = self.Model.Parameters.get("Address", "")


class Button(object):
	def __init__(self, properties):
		self.Properties = properties
		self._Status = False

	@property
	def Status(self):
		return self._Status