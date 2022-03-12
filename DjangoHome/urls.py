import os

from django.conf.urls import url, include
from django.contrib import admin
from rest_framework import routers

from DjangoHome import settings
from DjangoHome.containers import Container

router = routers.DefaultRouter()

container = Container()
container.config.from_dict(settings.__dict__)

urlpatterns = [
	url(r'^', include(router.urls)),
	url(r'^admin/', admin.site.urls),
	url(r'^andConditions', container.andConditionController().as_view()),
	url(r'^propertyInfo', container.propertyInfoController().as_view()),
	url(r'^conditions', container.conditionController().as_view()),
	url(r'^controls', container.controlController().as_view()),
	url(r'^interfaces', container.interfaceController().as_view()),
	url(r'^functions', container.functionController().as_view()),
	url(r'^properties', container.propertyController().as_view()),
	url(r'^devices', container.deviceController().as_view()),
	url(r'^tasks', container.taskController().as_view()),
	url(r'^groups', container.groupController().as_view()),
]

isStartDevices = bool(os.environ.get('START_DEVICES', 0))
if isStartDevices:
	print("Starting devices up...")
	deviceService = container.deviceService()
	container.propertyService()
	container.conditionService()
	deviceService.ProduceDevices()
else:
	print("Skipping device startup. To enable set environment variable START_DEVICES=True")
