from django.db import models
from django.contrib.auth.models import User



class Category(models.Model):
    title=models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.title
    
class Post(models.Model):
    title=models.CharField(max_length=255)
    category=models.ForeignKey(Category, on_delete=models.CASCADE)
    job_title=models.CharField(max_length=200)
    description=models.TextField()
    description2=models.TextField()
    description3=models.TextField(default=0)
    description4=models.TextField(default=0)
    description5=models.TextField(default=0)
    description6=models.TextField(default=0)
    description7=models.TextField(default=0)
    image=models.ImageField(upload_to="static/images")
    created_at= models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.title
    

class Donor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=50, default='name')
    address = models.TextField(max_length=500, default='address')
    phone_number = models.BigIntegerField(default=10)
    place = models.CharField(max_length=255,default="place")
    district = models.CharField(max_length=255,default="district")
    email=models.EmailField()
    image = models.ImageField(upload_to='static/images')
    created_at = models.DateTimeField(auto_now_add=True)




class Organizationtype(models.Model):
    title=models.CharField(max_length=255)
    def __str__(self):
        return self.title


 
class Organization(models.Model):
    organizationtype=models.ForeignKey(Organizationtype, on_delete=models.CASCADE)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    organization_name = models.CharField(max_length=50)
    address = models.TextField(max_length=500, default='address')
    email = models.EmailField(max_length=50, default='email')
    website = models.CharField(max_length=50)
    phone_number = models.BigIntegerField(default=0)
    description = models.TextField(max_length=500)
    organization_location = models.CharField(max_length=50)
    vision = models.CharField(max_length=1000)
    mission = models.CharField(max_length=1000)
    image = models.ImageField(upload_to="static/images", default='image')
    created_at = models.DateTimeField(auto_now_add=True)

class Organizationstories(models.Model):
    organization=models.ForeignKey(Organization, on_delete=models.CASCADE)
    description=models.TextField(max_length=150)
    image = models.ImageField(upload_to="static/stories", default='image')


class Organizationnews(models.Model):
    organization=models.ForeignKey(Organization, on_delete=models.CASCADE)
    description=models.TextField(max_length=150)
    image = models.ImageField(upload_to="static/news", default='image')

class Organizationgoal(models.Model):
    organization=models.ForeignKey(Organization, on_delete=models.CASCADE)
    description=models.TextField(max_length=150)

class Donormap(models.Model):
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE)
    donor = models.ForeignKey(Donor, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    
class Donation(models.Model):
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE)
    organization_name=models.CharField(max_length=50)
    donor = models.ForeignKey(Donor, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=13, decimal_places=0)
    donor_name = models.CharField(max_length=50)
    address = models.TextField(max_length=500)
    created_at = models.DateTimeField(auto_now_add=True)


class Organization_multi_image(models.Model):
    image = models.ImageField(upload_to='Organization_multi_image',null=True,blank=True)
    organization = models.ForeignKey(Organization,on_delete=models.CASCADE,null=True, default=None)
    created_at = models.TimeField(auto_now_add=True)
    def __str__(self):
      return str(self.image)