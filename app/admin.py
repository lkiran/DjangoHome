from django.contrib import admin

from DjangoHome import containers
from app.models import *


def generate(modeladmin, request, queryset):
	generate.short_description = "Generates prefab contents"

	__deviceRepo = containers.containers.deviceRepository()
	for prefab in queryset.all():
		__deviceRepo.Save(prefab.Template)


class PrefabAdmin(admin.ModelAdmin):
	actions = [generate]


admin.site.register(Prefab, PrefabAdmin)
admin.site.register(Property)
admin.site.register(Control)
admin.site.register(Device)
admin.site.register(Function)
admin.site.register(Task)
admin.site.register(Condition)
admin.site.register(Interface)
admin.site.register(Category)
admin.site.register(Group)
admin.site.register(GroupDevice)
