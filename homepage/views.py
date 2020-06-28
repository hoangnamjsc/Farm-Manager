from django.shortcuts import render, redirect
from .forms import (
    RegisterForm,
    ChangeInfoForm,
)
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash, login as auth_login, authenticate
from django.contrib.auth.decorators import login_required
from .models import UserProfile

# Create your views here.
def index(request):
    return render(request,'homepage/home.html')


def register(request):
    if not request.user.is_authenticated:
        if request.method == 'POST':
            form = RegisterForm(request.POST)
            if form.is_valid():
                form.save()
                return render(request,'homepage/register_success.html')
        else:
            form = RegisterForm()
        args = {'form': form}
        return render(request, 'homepage/register.html', args)
    else:
        return redirect('homepage:profile')


def login(request):
    if not request.user.is_authenticated:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                auth_login(request, user)
                return redirect('dashboard:index')
        return render(request, 'homepage/login.html')
    else:
        return redirect('dashboard:c')


@login_required(login_url='/login/')
def profile(request):
    profile = UserProfile.objects.get(user = request.user)
    args = {'user': request.user, 'profile': profile}
    return render(request, 'homepage/profile.html', args)


@login_required(login_url='/login/')
def change_info(request):
    if request.method == 'POST':
        form = ChangeInfoForm(request.POST, instance = request.user)
        if form.is_valid():
            form.save()
            return redirect('homepage:profile')
    else:
        form = ChangeInfoForm(instance = request.user)
    args = {'form': form}
    return render(request, 'homepage/change_info.html', args)


@login_required(login_url='/login/')
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(data = request.POST, user = request.user)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect('homepage:profile')
        else:
            return redirect('homepage:change_password')
    else:
        form = PasswordChangeForm(user = request.user)
    args = {'form': form}
    return render(request, 'homepage/change_password.html', args)

def aboutus(request):
    return render(request, 'homepage/about.html')

def contact(request):
    return  render(request, 'homepage/contact.html')
