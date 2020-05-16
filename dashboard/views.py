from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import Staff


# Create your views here.
@login_required(login_url='/login/')
def index(request):
    return render(request, 'dashboard/index.html')

@login_required(login_url='/login/')
def widgets(request):
    return render(request, 'dashboard/widgets.html')

@login_required(login_url='/login/')
def forms(request):
    if request.method == 'POST':
        farm_id = request.user
        staff_name = request.POST.get('fullname_form')
        staff_phone = request.POST.get('phone_form')
        staff_email = request.POST.get('email_form')
        staff_position = request.POST.get('position_form')
        print(staff_position)
        data = Staff.objects.create(farm_id=farm_id, staff_name=staff_name, staff_phone=staff_phone, staff_email=staff_email, staff_position=staff_position)
        data.save()
        return render(request,'dashboard/addstaff_success.html')
    return render(request, 'dashboard/addstaff.html')

@login_required(login_url='/login/')
def tables(request):
    return render(request, 'dashboard/tables.html')

@login_required(login_url='/login/')
def demo(request):
    form = StaffForm(request.POST)
    if form.is_valid():
        post = form.save(commit=False)
        post.staff_id = request.user
        post.save()
        return redirect('homepage:profile')
    args = {'form': form}
    return render(request, 'homepage/demo.html', args)