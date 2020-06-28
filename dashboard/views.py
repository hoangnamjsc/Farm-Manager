from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Staff, Warehouse, Calendar
from .forms import StaffForm, WarehouseForm
from django.http import JsonResponse
from django.template.loader import render_to_string


# Create your views here.
@login_required(login_url='/login/')
def index(request):
    staff = Staff.objects.all()
    warehouse = Warehouse.objects.all()
    args = {'staff': staff, 'warehouse': warehouse}
    return render(request, 'dashboard/index.html', args)

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


#### CRUD ####
@login_required(login_url='/login/')
def staff_list(request):
    staffs = Staff.objects.filter(farm_id=request.user)
    context = {
        'staffs': staffs
    }
    return render(request, 'dashboard/staff_list.html', context)


def save_all(request, form, template_name):
    data = dict()
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
            staffs = Staff.objects.filter(farm_id=request.user)
            data['book_list'] = render_to_string('dashboard/staff_list_2.html', {'staffs': staffs})
        else:
            data['form_is_valid'] = False
    context = {
        'form': form
    }
    data['html_form'] = render_to_string(template_name, context, request=request)
    return JsonResponse(data)


def staff_update(request, id):
    staff = get_object_or_404(Staff, id=id)
    if request.method == 'POST':
        form = StaffForm(request.POST, instance=staff)
    else:
        form = StaffForm(instance=staff)
    return save_all(request, form, 'dashboard/staff_update.html')


def staff_delete(request, id):
    data = dict()
    staff = get_object_or_404(Staff, id=id)
    if request.method == "POST":
        staff.delete()
        data['form_is_valid'] = True
        staffs = Staff.objects.filter(farm_id=request.user)
        data['book_list'] = render_to_string('dashboard/staff_list_2.html', {'staffs': staffs})
    else:
        context = {'staff': staff}
        data['html_form'] = render_to_string('dashboard/staff_delete.html', context, request=request)

    return JsonResponse(data)
#### END CRUD ####

@login_required(login_url='/login/')
def additem(request):
    if request.method == 'POST':
        farm_id = request.user
        housename = request.POST.get('housename')
        product_name = request.POST.get('product_name')
        amount = request.POST.get('amount')
        data = Warehouse.objects.create(farm_id=farm_id, name=housename, product_name=product_name,
                                        amount=amount)
        data.save()
        messages.success(request, 'Thêm thông tin thành công.')
        ###
    return render(request, 'dashboard/additem.html')

@login_required(login_url='/login/')
def calendar(request):
    data = Calendar.objects.all()
    args = {'data': data}
    return render(request, 'dashboard/calendar.html', args)


@login_required(login_url='/login/')
def warehouse(request):
    warehouses = Warehouse.objects.filter(farm_id=request.user)
    context = {
        'warehouses': warehouses
    }
    return render(request, 'dashboard/warehouse_list.html', context)


def save_all_warehouses(request, form, template_name):
    data = dict()
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
            warehouses = Warehouse.objects.filter(farm_id=request.user)
            data['book_list'] = render_to_string('dashboard/warehouse_list_2.html', {'warehouses': warehouses})
        else:
            data['form_is_valid'] = False
    context = {
        'form': form
    }
    data['html_form'] = render_to_string(template_name, context, request=request)
    return JsonResponse(data)


def warehouse_update(request, id):
    warehouse = get_object_or_404(Warehouse, id=id)
    if request.method == 'POST':
        form = WarehouseForm(request.POST, instance=warehouse)
    else:
        form = WarehouseForm(instance=warehouse)
    return save_all_warehouses(request, form, 'dashboard/warehouse_update.html')


def warehouse_delete(request, id):
    data = dict()
    warehouse = get_object_or_404(Warehouse, id=id)
    if request.method == "POST":
        warehouse.delete()
        data['form_is_valid'] = True
        warehouses = Warehouse.objects.filter(farm_id=request.user)
        data['book_list'] = render_to_string('dashboard/warehouse_list_2.html', {'warehouses': warehouses})
    else:
        context = {'warehouse': warehouse}
        data['html_form'] = render_to_string('dashboard/warehouse_delete.html', context, request=request)

    return JsonResponse(data)
#### END CRUD ####


