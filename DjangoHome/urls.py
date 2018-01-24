from datetime import datetime

import django.contrib.auth.views
from django.conf.urls import url, include
from django.contrib import admin

import app.views
from app.Controllers.ConditionController import ConditionController
from app.Controllers.ControlController import ControlController
from app.Controllers.DeviceController import DeviceController
from app.Controllers.TaskController import TaskController

urlpatterns = [
	# Examples:
	url(r'^$', app.views.home, name='home'),
	url(r'^contact$', app.views.contact, name='contact'),
	url(r'^about', app.views.about, name='about'),
	url(r'^login/$',
		django.contrib.auth.views.login,
		{
			'template_name': 'app/login.html',
			'authentication_form': app.forms.BootstrapAuthenticationForm,
			'extra_context':
			{
				'title': 'Log in',
				'year': datetime.now().year,
			}
		},
		name='login'),
	url(r'^logout$',
		django.contrib.auth.views.logout,
		{
			'next_page': '/',
		},
		name='logout'),

	url(r'^admin/', admin.site.urls),

	url(r'^(?i)controls/', ControlController.as_view()),
	url(r'^(?i)devices/', DeviceController.as_view()),
	url(r'^(?i)tasks/', TaskController.as_view()),
	url(r'^(?i)condition/', ConditionController.as_view()),

	url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))

	# Uncomment the admin/doc line below to enable admin documentation:
	# url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

	# Uncomment the next line to enable the admin:
	# url(r'^admin/', include(admin.site.urls)),
]
