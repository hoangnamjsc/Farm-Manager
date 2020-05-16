from django.contrib import admin
from .models import Staff, Warehouse

# Admin page header
admin.site.site_header = 'Administration'

# Register your models here.
admin.site.register(Staff)
admin.site.register(Warehouse)