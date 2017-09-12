from datetime import datetime
from app.Controllers import ControlController
from django.contrib import admin
from django.conf.urls import url, include
import django.contrib.auth.views

import app.forms
import app.views

# Uncomment the next lines to enable the admin:
# from django.conf.urls import include
# from django.contrib import admin
# admin.autodiscover()

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
	url(r'^controls/', ControlController.ControlController.as_view()),
	url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))

	# Uncomment the admin/doc line below to enable admin documentation:
	# url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

	# Uncomment the next line to enable the admin:
	# url(r'^admin/', include(admin.site.urls)),
]
