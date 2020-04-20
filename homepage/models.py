from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

### Generator farm id ###
import random, string
def random_string_generator(chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(8))
###     *********     ###

# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    farm_id = models.CharField(max_length=8, unique=True, default=random_string_generator())

    def __str__(self):
        return self.user.username

def create_profile(sender, **kwargs):
    if kwargs['created']:
        user_profile = UserProfile.objects.create(user=kwargs['instance'])

post_save.connect(create_profile, sender=User)

