from django.db import models
from django.contrib.auth.models import User


# Create your models here.

# Staff
POSITION_CHOICES = (
    ('a','Quản Lý Kho'),
    ('b','Quản Lý Bán Hàng'),
    ('c','Quản Lý Sản Xuất'),
    ('d','Quản Lý Kế Toán'),
    ('x','None'),
)
class Staff(models.Model):
    farm_id = models.ForeignKey(User, on_delete=models.CASCADE)
    staff_name = models.CharField(max_length=250, default='')
    staff_position = models.CharField(max_length=100, choices=POSITION_CHOICES)
    staff_phone = models.CharField(max_length=10, default='')
    staff_email = models.EmailField(max_length=70, default='')
    def __str__(self):
        return self.staff_name

# Warehouse
WAREHOUSE_CHOICE = (
    ('a','Kho Cây Giống'),
    ('b','Kho Sản Phẩm'),
    ('c','Kho Vật Tư'),
    ('d', 'Kho Tồn')
)

class Warehouse(models.Model):
    farm_id = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, choices=WAREHOUSE_CHOICE)
    product_name = models.CharField(max_length=150, default='')
    amount = models.IntegerField(default='1')

    def __str__(self):
        return self.product_name


TIME_CALENDAR = (
    ('a', 'Ca 1 (7h30 - 11h30)'),
    ('b', 'Ca 2 (13h30 - 16h30)'),

)
class Calendar(models.Model):
    farm_id = models.ForeignKey(User, on_delete=models.CASCADE)
    time = models.CharField(max_length=100, choices=TIME_CALENDAR, blank=False)
    thu2 = models.CharField(max_length=100, choices=POSITION_CHOICES)
    thu3 = models.CharField(max_length=100, choices=POSITION_CHOICES)
    thu4 = models.CharField(max_length=100, choices=POSITION_CHOICES)
    thu5 = models.CharField(max_length=100, choices=POSITION_CHOICES)
    thu6 = models.CharField(max_length=100, choices=POSITION_CHOICES)
    thu7 = models.CharField(max_length=100, choices=POSITION_CHOICES)
    chunhat = models.CharField(max_length=100, choices=POSITION_CHOICES)



class Book(models.Model):

    BOOK_TYPES = (
        (u"Hardcover", u'Hardcover'),
        (u"Paperback", u'Paperback'),
        (u"E-book", u'E-book'),
    )
    title = models.CharField(max_length=50)
    publication_date = models.DateField(null=True)
    author = models.CharField(max_length=30, blank=True)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    pages = models.IntegerField(blank=True, null=True)
    book_type = models.CharField(choices=BOOK_TYPES,max_length=120)

    def __str__(self):
        return self.title