from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Staff, Warehouse, Calendar, Book
from .forms import StaffForm, BookForm
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
    pass


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
def tables(request):
    data = Staff.object.all()
    args = {'data': data}
    return render(request, 'dashboard/tables.html', args)


@login_required(login_url='/login/')
def calendar(request):
    data = Calendar.objects.all()
    args = {'data': data}
    return render(request, 'dashboard/calendar.html', args)


@login_required(login_url='/login/')
def warehouse(request):
    data = Warehouse.objects.all()
    args = {'house': data}
    return render(request, 'dashboard/warehouse.html', args)


class CrudView(TemplateView):
    template_name = 'dashboard/demo.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['data'] = Staff.objects.all()
        return context


# Demo CRUD

def book_list(request):
    books = Book.objects.all()
    context = {
        'books': books
    }
    return render(request, 'dashboard/book_list.html', context)


def save_all(request, form, template_name):
    data = dict()
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
            books = Book.objects.all()
            data['book_list'] = render_to_string('dashboard/book_list_2.html', {'books': books})
        else:
            data['form_is_valid'] = False
    context = {
        'form': form
    }
    data['html_form'] = render_to_string(template_name, context, request=request)
    return JsonResponse(data)


def book_create(request):
    if request.method == 'POST':
        form = BookForm(request.POST)
    else:
        form = BookForm()
    return save_all(request, form, 'dashboard/book_create.html')


def book_update(request, id):
    book = get_object_or_404(Book, id=id)
    if request.method == 'POST':
        form = BookForm(request.POST, instance=book)
    else:
        form = BookForm(instance=book)
    return save_all(request, form, 'dashboard/book_update.html')


def book_delete(request, id):
    data = dict()
    book = get_object_or_404(Book, id=id)
    if request.method == "POST":
        book.delete()
        data['form_is_valid'] = True
        books = Book.objects.all()
        data['book_list'] = render_to_string('dashboard/book_list_2.html', {'books': books})
    else:
        context = {'book': book}
        data['html_form'] = render_to_string('dashboard/book_delete.html', context, request=request)

    return JsonResponse(data)
