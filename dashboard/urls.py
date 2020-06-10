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

    path('calendar/', views.calendar, name='calendar'),
    path('additem/', views.additem, name='additem'),
    path('warehouse/', views.warehouse, name='warehouse'),
    path('tables/', views.tables, name='tables'),


    url(r'^books/$', views.book_list, name='book_list'),
    url(r'^books/create$', views.book_create, name='book_create'),
    url(r'^books/(?P<id>\d+)/update$', views.book_update, name='book_update'),
    url(r'^books/(?P<id>\d+)/delete$', views.book_delete, name='book_delete'),
]