from django import forms
from .models import Staff, Warehouse

class StaffForm(forms.ModelForm):
    staff_name = forms.CharField()
    staff_phone = forms.CharField()
    staff_email = forms.EmailField()
    class Meta:
        model = Staff
        fields = ('staff_name','staff_phone','staff_email','staff_position', 'staff_salary')

class WarehouseForm(forms.ModelForm):
    class Meta:
        model = Warehouse
        fields = ('name','product_name','amount')