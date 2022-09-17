from django.conf.urls import url, include
from django.contrib import admin
from rest_framework import routers

from DjangoHome.Controllers.AndConditionController import AndConditionController
from DjangoHome.Controllers.ConditionController import ConditionController
from DjangoHome.Controllers.ControlController import ControlController
from DjangoHome.Controllers.DeviceController import DeviceController
from DjangoHome.Controllers.FunctionController import FunctionController
from DjangoHome.Controllers.GroupController import GroupController
from DjangoHome.Controllers.InterfaceController import InterfaceController
from DjangoHome.Controllers.PropertyController import PropertyController
from DjangoHome.Controllers.PropertyInfoController import PropertyInfoController
from DjangoHome.Controllers.TaskController import TaskController

router = routers.DefaultRouter()

urlpatterns = [
	url(r'^admin/', admin.site.urls),
	url(r'^api/v1/', include(router.urls)),
	url(r'^api/v1/andConditions', AndConditionController.as_view()),
	url(r'^api/v1/propertyInfo', PropertyInfoController.as_view()),
	url(r'^api/v1/conditions', ConditionController.as_view()),
	url(r'^api/v1/controls', ControlController.as_view()),
	url(r'^api/v1/interfaces', InterfaceController.as_view()),
	url(r'^api/v1/functions', FunctionController.as_view()),
	url(r'^api/v1/properties', PropertyController.as_view()),
	url(r'^api/v1/devices', DeviceController.as_view()),
	url(r'^api/v1/tasks', TaskController.as_view()),
	url(r'^api/v1/groups', GroupController.as_view()),
]
