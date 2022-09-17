import os

from django.apps import AppConfig



class Executor(AppConfig):
	name = 'executor'
	verbose_name = 'Device Executor Service'

	def ready(self):
		isStartDevices = bool(os.environ.get('START_DEVICES', 0))
		if isStartDevices:
			print("Starting devices up...")
			from DjangoHome import containers
			containers.containers.deviceService().produceDevices()
		else:
			print("Skipping device startup. To enable set environment variable START_DEVICES=True")
