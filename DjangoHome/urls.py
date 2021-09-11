from django.conf.urls import url, include
from django.contrib import admin
from rest_framework import routers

from app.Controllers.AndConditionController import AndConditionController
from app.Controllers.ConditionController import ConditionController
from app.Controllers.ControlController import ControlController
from app.Controllers.DeviceController import DeviceController
from app.Controllers.FunctionController import FunctionController
from app.Controllers.GroupController import GroupController
from app.Controllers.InterfaceController import InterfaceController
from app.Controllers.PropertyController import PropertyController
from app.Controllers.PropertyInfoController import PropertyInfoController
from app.Controllers.TaskController import TaskController
from app.DatabaseServices.DeviceService import DeviceService

router = routers.DefaultRouter()
urlpatterns = [
	url(r'^', include(router.urls)),
	url(r'^admin/', admin.site.urls),
	url(r'^andConditions', AndConditionController.as_view()),
	url(r'^propertyInfo', PropertyInfoController.as_view()),
	url(r'^conditions', ConditionController.as_view()),
	url(r'^controls', ControlController.as_view()),
	url(r'^interfaces', InterfaceController.as_view()),
	url(r'^functions', FunctionController.as_view()),
	url(r'^properties', PropertyController.as_view()),
	url(r'^devices', DeviceController.as_view()),
	url(r'^tasks', TaskController.as_view()),
	url(r'^groups', GroupController.as_view()),
]

deviceService = DeviceService.Instance()
deviceService.ProduceDevices()
print("----------------------------------------")
