from django.shortcuts import render, redirect
from  django.http import HttpResponse
from homepage.forms import (
    RegisterForm,
    ChangeInfoForm
)
from django.contrib.auth.models import User
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required

# Create your views here.

def index(request):
    return render(request,'homepage/home.html')

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request,'homepage/register_success.html')
    else:
        form = RegisterForm()
    args = {'form': form}
    return render(request, 'homepage/register.html', args)

@login_required(login_url='/login/')
def profile(request):
    args = {'user': request.user}
    return render(request, 'homepage/profile.html', args)

@login_required(login_url='/login/')
def change_info(request):
    if request.method == 'POST':
        form = ChangeInfoForm(request.POST, instance = request.user)
        if form.is_valid():
            form.save()
            return redirect('/profile')
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
            return redirect('/profile')
        else:
            return redirect('/profile/password')
    else:
        form = PasswordChangeForm(user = request.user)
    args = {'form': form}
    return render(request, 'homepage/change_password.html', args)