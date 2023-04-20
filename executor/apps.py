import os

from django.apps import AppConfig



class Executor(AppConfig):
	name = 'executor'
	verbose_name = 'Device Executor Service'

	def ready(self):
		isStartDevices = bool(os.environ.get('START_DEVICES', 0))
		if isStartDevices:
			from DjangoHome import containers
			for provider in [p for (k, p) in containers.containers.providers.items() if p.kwargs.get('serviceBus')]:
				provider()  # instantiate services that depends on the bus

			print("Starting devices up...")
			containers.containers.deviceService().produceDevices()
		else:
			print("Skipping device startup. To enable set environment variable START_DEVICES=True")
