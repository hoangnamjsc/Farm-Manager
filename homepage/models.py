from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save


### Generator farm id ###
import random, string
def random_string_generator():
    return ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))
###     *********     ###

# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    #farm_id = models.CharField(max_length=8, default=random_string_generator(), unique=True)
    farm_name = models.CharField(max_length=250, default='Farm_name')

    def __str__(self):
        return self.user.username

def create_profile(sender, **kwargs):
    if kwargs['created']:
        user_profile = UserProfile.objects.create(user=kwargs['instance'])
post_save.connect(create_profile, sender=User)


