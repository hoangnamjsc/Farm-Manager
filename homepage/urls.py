from django.urls import path
from . import views
from django.contrib.auth.views import LoginView, LogoutView

app_name = 'homepage'
urlpatterns = [
    path('', views.index, name='index'),
    path('login/', LoginView.as_view(template_name='homepage/login.html'), name='login'),
    path('logout/', LogoutView.as_view(template_name='homepage/logout.html'), name='logout'),
    path('register/', views.register, name='register'),
    path('profile/', views.profile, name='profile'),
    path('profile/edit/', views.change_info, name='change_info'),
    path('profile/password/', views.change_password, name='change_password'),
]