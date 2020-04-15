from django.contrib import admin
from homepage.models import UserProfile

admin.site.site_header = 'Administration'


admin.site.register(UserProfile)