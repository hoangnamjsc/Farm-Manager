from django.urls import path
from django.conf.urls import url
from . import views

###
app_name = 'dashboard'
urlpatterns = [
    # Index
    path('', views.index, name='index'),
    # Calendar
    path('calendar/', views.calendar, name='calendar'),
    # Staff
    path('staffadd/', views.addstaff, name='addstaff'),
    url(r'^staffs/$', views.staff_list, name='staff_list'),
    url(r'^staffs/(?P<id>\d+)/update$', views.staff_update, name='staff_update'),
    url(r'^staffs/(?P<id>\d+)/delete$', views.staff_delete, name='staff_delete'),
    # Warehouse
    path('additem/', views.additem, name='additem'),
    url(r'^warehouse/$', views.warehouse, name='warehouse'),
    url(r'^warehouse/(?P<id>\d+)/update$', views.warehouse_update, name='warehouse_update'),
    url(r'^warehouse/(?P<id>\d+)/delete$', views.warehouse_delete, name='warehouse_delete'),
]