from django.urls import path
from . import views

app_name = 'dashboard'
urlpatterns = [
    path('', views.index, name='index'),
    path('demo/', views.demo, name='demo'),
    path('widgets/', views.widgets, name='widgets'),
    path('forms/', views.forms, name='forms'),
    path('tables/', views.tables, name='tables'),
]