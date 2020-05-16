from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView
from django.contrib.auth.decorators import login_required

app_name = 'homepage'
urlpatterns = [
    path('', views.index, name='index'),
    path('register/', views.register, name='register'),
    path('login/', views.login, name='login'),
    path('logout/', login_required(LogoutView.as_view(template_name='homepage/logout.html')), name='logout'),
    path('profile/', views.profile, name='profile'),
    path('profile/edit/', views.change_info, name='change_info'),
    path('profile/password/', views.change_password, name='change_password'),
]