from django.contrib import admin
from .models import UserProfile

# Admin page header
admin.site.site_header = 'Administration'

# Register models here
admin.site.register(UserProfile)
