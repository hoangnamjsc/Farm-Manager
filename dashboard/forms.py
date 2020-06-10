from django import forms
from .models import Staff, Book

class StaffForm(forms.ModelForm):
    staff_name = forms.CharField()
    staff_phone = forms.CharField()
    staff_email = forms.EmailField()
    class Meta:
        model = Staff
        fields = ('staff_name','staff_phone','staff_email','staff_position')


class BookForm(forms.ModelForm):
	publication_date = forms.DateTimeInput()
	class Meta:
		model = Book
		fields = ('title', 'publication_date', 'author', 'price', 'pages', 'book_type', )