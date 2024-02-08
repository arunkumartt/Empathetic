from django.contrib import admin
from.models import *

# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    list_display=('title',)

admin.site.register(Category,CategoryAdmin) 



class PostAdmin(admin.ModelAdmin):
    list_display=('title','category','job_title','description','description2','description3','description4','description5','description6','description7','image',)
    fields =('title','category','job_title','description','description2','description3','description4','description5','description6','description7','image',)

admin.site.register(Post,PostAdmin) 

class DonorAdmin(admin.ModelAdmin):
    list_display=('user','name','address','phone_number','place','district','email','image',)
    fields =('user','name','address','phone_number','place','district','email','image',)
admin.site.register(Donor,DonorAdmin) 

class OrganizationstoriesAdmin(admin.ModelAdmin):
    list_display=('description','image','organization',)
    fields=('description','image','organization',)
admin.site.register(Organizationstories,OrganizationstoriesAdmin) 

class OrganizationAdmin(admin.ModelAdmin):
    list_display=('user','organizationtype','organization_name','address','email','website','phone_number','description','organization_location','vision','mission','image',)
    fields=('user','organizationtype','organization_name','address','email','website','phone_number','description','organization_location','vision','mission','image',)
admin.site.register(Organization,OrganizationAdmin) 

class OrganizationnewsAdmin(admin.ModelAdmin):
    list_display=('description','image','organization',)
    fields=('description','image','organization',)
admin.site.register(Organizationnews,OrganizationnewsAdmin) 

class OrganizationgoalAdmin(admin.ModelAdmin):
    list_display=('description','organization',)
    fields=('description','organization',)
admin.site.register(Organizationgoal,OrganizationgoalAdmin) 

class OrganizationtypeAdmin(admin.ModelAdmin):
    list_display=('title',)

admin.site.register(Organizationtype,OrganizationtypeAdmin) 


class DonationAdmin(admin.ModelAdmin):
    list_display=('organization','donor','amount','donor_name','address','organization_name')
    fields = ('organization','donor','amount','donor_name','address','organization_name')

admin.site.register(Donation,DonationAdmin)



class DonormapAdmin(admin.ModelAdmin):
    list_display=('organization','donor','status',)
    fields = ('organization','donor','status',)

admin.site.register(Donormap,DonormapAdmin)




class Organization_multi_imageAdmin(admin.ModelAdmin):
    list_display=('image',)
    feilds=('image',)
    
admin.site.register(Organization_multi_image,Organization_multi_imageAdmin)