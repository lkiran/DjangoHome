import logging

from app.HardwareServices.DeviceFactory import DeviceFactory
from app.Repositories.DeviceRepository import DeviceRepository


class DeviceService(object):
	Devices = []

	__instance = None
	__logger = logging.getLogger('DeviceService')
	__deviceRepository = DeviceRepository()

	@staticmethod
	def Instance():
		if DeviceService.__instance is None:
			DeviceService()
		return DeviceService.__instance

	def __init__(self):
		if DeviceService.__instance is not None:
			raise Exception("DeviceService is a singleton, use 'DeviceService.Instance()'")
		else:
			self.__logger.info("Init")
			DeviceService.__instance = self

	def ProduceDevices(self):
		devices = self.__deviceRepository.Get()
		factory = DeviceFactory()
		self.Devices = [(lambda d: factory.Produce(d))(d) for d in devices]
		print u"All {0} devices are produced".format(len(self.Devices))

	def GetProducedDeviceById(self, id):
		return next((d for d in self.Devices if d.Model.Id == id), None)

	def GetProducedDeviceFunction(self, id, functionName):
		producedDevice = self.GetProducedDeviceById(id)
		if producedDevice is None:
			raise Exception("Device is not alive!")
		return getattr(producedDevice, functionName)
