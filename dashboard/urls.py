from django.urls import path
from django.conf.urls import url
from . import views

app_name = 'dashboard'
urlpatterns = [
    path('', views.index, name='index'),
    path('demo/', views.CrudView.as_view(), name='crud_ajax'),
    path('widgets/', views.widgets, name='widgets'),
    path('staffadd/', views.addstaff, name='addstaff'),
    # Staff Manager
    url(r'^staffmanager/$', views.staff_list, name='staffmanager'),
    url(r'^staffmanager/(?P<id>\d+)/update$', views.staff_update, name='staff_update'),

    path('additem/', views.additem, name='additem'),
    path('tables/', views.tables, name='tables'),
]