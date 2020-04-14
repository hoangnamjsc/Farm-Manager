from django.shortcuts import render, redirect
from  django.http import HttpResponse
from accounts.forms import RegisterForm

# Create your views here.

def index(request):
    return render(request,'accounts/home.html')

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request,'accounts/home.html')
    else:
        form = RegisterForm()
    args = {'form': form}
    return render(request, 'accounts/register.html', args)
