from django.contrib import admin
from .models import Staff, Warehouse, Calendar, Book

# Admin page header
admin.site.site_header = 'Administration'

# Register your models here.
admin.site.register(Staff)
admin.site.register(Warehouse)
admin.site.register(Calendar)
admin.site.register(Book)