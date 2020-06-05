from django.db import models
from django.contrib.auth.models import User


# Create your models here.

# Staff
POSITION_CHOICES = (
    ('a','Quản Lý Kho'),
    ('b','Quản Lý Bán Hàng'),
    ('c','Quản Lý Sản Xuất'),
    ('d','Quản Lý Kế Toán'),
)
class Staff(models.Model):
    farm_id = models.ForeignKey(User, on_delete=models.CASCADE, editable=False)
    staff_name = models.CharField(max_length=250, default='')
    staff_position = models.CharField(max_length=100, choices=POSITION_CHOICES, default='a')
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
# PRODUCT_CODE
PRODUCT_CODE = (
    ('a','Bắp Cải Xanh'),
    ('b','Cần Tây'),
    ('c','Xà Lách'),
    ('d','Cà Chua'),
    ('e','Củ Cải Trắng'),
)
class Warehouse(models.Model):
    farm_id = models.ForeignKey(User, on_delete=models.CASCADE, editable=False)
    name = models.CharField(max_length=100, choices=WAREHOUSE_CHOICE, default='a')
    product_name = models.CharField(max_length=150, choices=PRODUCT_CODE ,default='a')
    amount = models.IntegerField(default='1')

    def __str__(self):
        return self.name


class CrudUser(models.Model):
    name = models.CharField(max_length=30, blank=True)
    address = models.CharField(max_length=100, blank=True)
    age = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name