from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Staff, Warehouse, CrudUser
from .forms import StaffForm
from django.views.generic import TemplateView, View, DeleteView
from django.http import JsonResponse
from django.template.loader import render_to_string

# Create your views here.
@login_required(login_url='/login/')
def index(request):
    return render(request, 'dashboard/index.html')

@login_required(login_url='/login/')
def widgets(request):
    return render(request, 'dashboard/widgets.html')

@login_required(login_url='/login/')
def addstaff(request):
    if request.method == 'POST':
        farm_id = request.user
        staff_name = request.POST.get('fullname_form')
        staff_phone = request.POST.get('phone_form')
        staff_email = request.POST.get('email_form')
        staff_position = request.POST.get('position_form')
        data = Staff.objects.create(farm_id=farm_id, staff_name=staff_name, staff_phone=staff_phone,
                                        staff_email=staff_email, staff_position=staff_position)
        data.save()
        messages.success(request, 'Thêm thông tin thành công.')
        ###
    return render(request, 'dashboard/addstaff.html')

@login_required(login_url='/login/')
def staff_list(request):
	staffs = Staff.objects.all()
	args = {
	'staffs': staffs
	}
	return render(request, 'dashboard/staffmanager.html',args)

def save_all(request,form,template_name):
	data = dict()
	if request.method == 'POST':
		if form.is_valid():
			form.save()
			data['form_is_valid'] = True
			staffs = Staff.objects.all()
			data['staff_list'] = render_to_string('dashboard/staffmanager_2.html',{'staffs':staffs})
		else:
			data['form_is_valid'] = False
	args = {
	'form':form
	}
	data['html_form'] = render_to_string(template_name,args,request=request)
	return JsonResponse(data)

def staff_update(request,id):
	staff = get_object_or_404(Staff,id=id)
	if request.method == 'POST':
		form = StaffForm(request.POST,instance=staff)
	else:
		form = StaffForm(instance=staff)
	return save_all(request,form,'dashboard:staff_update.html')

@login_required(login_url='/login/')
def additem(request):
    if request.method == 'POST':
        farm_id = request.user
        staff_name = request.POST.get('fullname_form')
        staff_phone = request.POST.get('phone_form')
        staff_email = request.POST.get('email_form')
        staff_position = request.POST.get('position_form')
        data = Staff.objects.create(farm_id=farm_id, staff_name=staff_name, staff_phone=staff_phone,
                                        staff_email=staff_email, staff_position=staff_position)
        data.save()
        messages.success(request, 'Thêm thông tin thành công.')
        ###
    return render(request, 'dashboard/additem.html')

@login_required(login_url='/login/')
def tables(request):
    data = Staff.object.all()
    args = {'data': data}
    return render(request, 'dashboard/tables.html', args)


class CrudView(TemplateView):
    template_name = 'dashboard/demo.html'
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['data'] = Staff.objects.all()
        return context