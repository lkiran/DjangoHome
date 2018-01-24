from app.models import Device


class DeviceRepository:
	def Get(self):
		return Device.objects.all()

	def Save(self, device):
		if device.Id == "":
			device.save()
			return device

		return Device.objects.filter(Id=device.Id).update(device)