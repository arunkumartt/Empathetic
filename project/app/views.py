from django.shortcuts import render,redirect,get_object_or_404
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from .models import *
from django.contrib.auth import authenticate, login,logout,update_session_auth_hash
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from .models import Organization_multi_image 
from .forms import MultipleImageUploadForm


def home(request):
    homecarosel=Post.objects.filter(category_id=1)
    homecontainer=Post.objects.filter(category_id=2)
    homecontainer2=Post.objects.filter(category_id=5)
    homesponser=Post.objects.filter(category_id=7)
    data={
        'homecarosel':homecarosel,
        'homecontainer' : homecontainer,
        'homecontainer2': homecontainer2,
        'homesponser' : homesponser,
    }
    return render(request,'home.html',data)


def about(request):
    homecontainer=Post.objects.filter(category_id=2)
    ourteam=Post.objects.filter(category_id=8)
    data={
        'homecontainer' : homecontainer,
        'ourteam' : ourteam,
    }
    return render(request,'about.html',data)



def gallery(request):
    return render(request,'gallery.html')


def contact(request):
    return render(request,'contact.html')


def organizationreg(request):
    organizationtype=Organizationtype.objects.all()
    data={
        'organizationtype' : organizationtype,
    }
    return render(request,'organizationreg.html',data)


def register(request):
    return render(request,'register.html')


def orgsave(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        confirmPassword = request.POST.get('conform_password')
        if password != confirmPassword:
             return JsonResponse({'error': 'Password and confirm password are not the same. Please enter them correctly.'}, status=400)
        organization_name = request.POST.get('organization_name')
        email = request.POST.get('email')
        address = request.POST.get('address')
        website = request.POST.get('website')
        phone_number = request.POST.get('phone_number')
        description = request.POST.get('description')
        organizationtype=request.POST.get('organizationtype')
        print(organizationtype)
        organization_location=request.POST.get('organization_location')
        vision=request.POST.get('vision')
        mission=request.POST.get('mission')
        image = request.FILES['Image']
        if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
                return JsonResponse({'error': 'Username or email is already in use.'}, status=400)

        
        user = User(username=username, email=email)
        user.set_password(password)
        user.save()

        organization = Organization(organization_name=organization_name, email=email, phone_number=phone_number,organizationtype_id=organizationtype,vision=vision,mission=mission, organization_location=organization_location, address=address, website=website, description=description, image=image,user=user )

        organization.save()

        return JsonResponse({'success': 'Organization registration successfuly'})
    else:
        return JsonResponse({'error': 'Invalid request method or not an AJAX request.'})


def donerregistration(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        confirmPassword = request.POST.get('confirmPassword')
        if password != confirmPassword:
             return JsonResponse({'error': 'Password and confirm password are not the same. Please enter them correctly.'}, status=400)

        name = request.POST.get('name')
        email = request.POST.get('email')
        address = request.POST.get('address')
        district = request.POST.get('district')
        place = request.POST.get('place')
        phone_number = request.POST.get('phone_number')
        image = request.FILES['Image']
        if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
                return JsonResponse({'error': 'Username or email is already in use.'}, status=400)

        
        user = User(username=username, email=email)
        user.set_password(password)
        user.save()

        donor = Donor(name=name, email=email, district=district,place=place ,phone_number=phone_number,address=address, image=image,user=user )

        donor.save()

        return JsonResponse({'success': 'Donor registration successfuly'})
    
    return render(request,'donerregistration.html')


def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            response_data = {'redirect': 'profile'}
                
            return JsonResponse(response_data)
        else:
            return JsonResponse({'error': 'Invalid credentials. username password is incorrect.'}, status=400)

    return render (request,'login.html')



@login_required
def profile(request):
    user_id = request.user.id
    data = {
        'log_det1': request.user
    }
    
    try:
        organization = Organization.objects.get(user_id=user_id)
        data['organization'] = organization
    except Organization.DoesNotExist:
        data['organization'] = None

    try:
        donor = Donor.objects.get(user_id=user_id)
        data['donor'] = donor
    except Donor.DoesNotExist:
        data['donor'] = None

    return render(request, 'profile.html', data)





@login_required
def user_logout(request):
    logout(request)
    return redirect('home') 




@login_required
def add_news(request,organization_id):
    organization = Organization.objects.get(id=organization_id)
    organizationnews = Organizationnews.objects.filter(organization_id=organization.id)
    print(organizationnews)
    data={
             'organization':organization,  
             'organizationnews':organizationnews   
        }
    return render(request,'add_news.html',data) 

@login_required
def save_news(request):

    if request.method == 'POST':    
        description = request.POST.get('description')
        image = request.FILES['Images'] 
        organization= request.POST.get('organization_id')
        news = Organizationnews(description=description,image=image,organization_id=organization )
        news.save()
        return JsonResponse({'success': 'News add successfuly'})




@login_required
def update_organization(request,user_id):
    ids=user_id
    user = User.objects.get(id=ids)
    organization = Organization.objects.get(user_id=user.id)
    type_of_organization=Organizationtype.objects.all()

    data={
             'organization':organization ,
             'user':user,
             'type_of_organization':type_of_organization   
        }
    return render(request,'update_organization.html',data)



@login_required
def updateorganization(request):
    
    if request.method == 'POST':
        organization_name = request.POST['organization_name']
        email = request.POST['email']
        address = request.POST['address']
        website = request.POST['website']
        phone_number = request.POST['phone_number']
        description = request.POST['description']
        type_of_organization_id=request.POST['type_of_organization']
        type_of_organization=get_object_or_404(Organizationtype,id=type_of_organization_id)
        organization_location=request.POST['organization_location']
        vision=request.POST['vision']
        mission=request.POST['mission']

        ids = request.user.id
        organization = Organization.objects.get(user_id=ids)
        organization.organization_name = organization_name
        organization.email = email
        organization.phone_number = phone_number
        organization.address = address
        organization.description = description
        organization.organizationtype = type_of_organization
        organization.website = website
        organization.organization_location = organization_location
        organization.vision = vision
        organization.mission = mission

        if 'image' in request.FILES:
              organization.image = request.FILES['image']

        organization.save()
        return JsonResponse({'message': 'Updated successfully!'})



@login_required
def update_donor(request,user_id):
    donors=Donor.objects.filter(user_id=user_id).first
    user = User.objects.get(id=user_id)
    data={
        "donor":donors,
        'user':user,
    }
    return render(request,'update_donor.html',data)




@login_required
def update(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        name=request.POST.get('name')
        address = request.POST.get('address')
        phone_number = request.POST.get('phone_number')
        place=request.POST.get('place')
        district=request.POST.get('district')
        ids = request.user.id
        donor = Donor.objects.get(user_id=ids)
        user = donor.user
        user.username = username
        user.email = email
        user.save()

        donor.name = name
        donor.address = address
        donor.place = place
        donor.email = email
        donor.district = district 
        donor.phone_number=phone_number

        if 'image' in request.FILES:
            donor.image = request.FILES['image']

        donor.save()
        return JsonResponse({'success': 'Donor update successfuly'})



@login_required
def notificationorganization(request,organization_id):
    organization = Organization.objects.get(id=organization_id)
    donations=Donation.objects.filter(organization_id=organization_id)
    data={
             'organization':organization,    
             'donations':donations
        }
    return render(request,'notificationorganization.html',data)



@login_required
def notificationdonor(request,donor_id):
    donor = Donor.objects.get(id=donor_id)
    donations=Donation.objects.filter(donor_id=donor.id)
    donation_ids = donations.values_list('organization_id', flat=True)  
    organization_names = Organization.objects.filter(id__in=donation_ids).values_list('organization_name', flat=True).first()
    data={
        'donor':donor,
        'organization_names':organization_names,
        'donations':donations,
    }

    return render(request,'notificationdonor.html',data)



def organization_list(request):
    organization=Organization.objects.all()
    organization_type=Organizationtype.objects.all()
    data={
        'organization_type':organization_type,
        'organization':organization,
    }
    return render(request,'organizationlist.html',data)



@login_required
def delete_account(request,user_id):
    donors=Donor.objects.filter(user_id=user_id).first
    user = User.objects.get(id=user_id)
    data={
        "donor":donors,
        'user':user,
    }
    return render(request,'delete_account.html',data)



@login_required
def delete_user(request):
    if request.method == 'POST':
        user_id = request.POST.get('user_id')
        user = User.objects.get(id=user_id)

        # Check if the provided username is correct
        username = request.POST.get('username')
        if username != request.user.username:
            return JsonResponse({'success': False, 'message': 'Incorrect username'})

        password = request.POST.get('password')
        confirmpassword = request.POST.get('confirmpassword')

        # Check if the password and confirm password match
        if password != confirmpassword:
            return JsonResponse({'success': False, 'message': 'Password and confirm password do not match'}, status=400)

        # Check if the provided password is correct
        if not request.user.check_password(password):
            return JsonResponse({'success': False, 'message': 'Incorrect old password'})

        # Ensure the authenticated user is the same as the user to be deleted
        if request.user == user:
            user.delete()
            return JsonResponse({'success': True, 'message': 'Your account has been deleted.', 'redirect': '/'})
        else:
            return JsonResponse({'success': False, 'message': 'You are not authorized to delete this user'})
    else:
        return JsonResponse({'success': False, 'message': 'Invalid request method'})

    



def organizationsingle(request,organization_id):
    organization = get_object_or_404(Organization, id=organization_id)

    organizationnews = Organizationnews.objects.filter(organization_id=organization_id) 
    organizationgoal = Organizationgoal.objects.filter(organization_id=organization_id)  
    organizationstories = Organizationstories.objects.filter(organization_id=organization_id)
    multi_image_org=Organization_multi_image.objects.filter(organization=organization.id)

    data={
        'organization':organization,
        'organizationnews':organizationnews,
        'organizationgoal':organizationgoal,
        'organizationstories':organizationstories,
        'multi_image_org':multi_image_org
    }

    return render(request,'organizationsingle.html',data)


@login_required
def add_image(request,organization_id):
    organization = Organization.objects.get(id=organization_id)
    multiimage=Organization_multi_image.objects.filter(organization_id=organization_id)
    data={
             'organization':organization,
             'multiimage':multiimage,     
        }
    return render(request,'add_image.html',data)


def addimagesave(request):
    if request.method=='POST':
       
        multi_images = request.POST.getlist('newsfeedsmultipleimg[]')
        organization_id=request.POST.get('organization_id')

        for multimage in multi_images:
            organization_multi_image = Organization_multi_image(image=multimage,organization_id=organization_id)
            organization_multi_image.save()  # Corrected the variable name
            Organization_multi_image.objects.filter(organization_id__isnull=True).delete()
      
        return JsonResponse({'message': 'Image added'})
    



def upload_image(request):

    if request.method == 'POST':
        form = MultipleImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            uploaded_image = form.save(commit=False)
            image_id = request.POST.get('image')
            uploaded_image.organization_id=image_id
            uploaded_image.save()
            return JsonResponse({'success': True, 'url': uploaded_image.image.url,'image_id':uploaded_image.id, 'name': uploaded_image.image.name})
        else:
            return JsonResponse({'success': False, 'errors': form.errors})

    return JsonResponse({'success': False, 'errors': 'Invalid request method'})


@login_required
def upload_multipleimage(request):
    if request.method == 'POST':
        org_id = request.POST.get('org_id')
        form = MultipleImageUploadForm(request.POST, request.FILES)

        if org_id is None:
            return JsonResponse({'success': False, 'errors': 'org_id is required'})

        if form.is_valid():
            uploaded_image = form.save(commit=False)
            uploaded_image.organization_id = org_id
            uploaded_image.save()

            return JsonResponse({'success': True, 'url': uploaded_image.image.url, 'organization': uploaded_image.organization_id, 'image_id':uploaded_image.id,'name': uploaded_image.image.name})
        else:
            return JsonResponse({'success': False, 'errors': form.errors})

    return JsonResponse({'success': False, 'errors': 'Invalid request method'})


@require_POST
def delete_uploaded_image_view(request):
    try:
        multi_id = request.POST.get('multi_id')
        images = Organization_multi_image.objects.get(id=multi_id)
        images.delete()

        return JsonResponse({'success': True})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})


@require_POST
def delete_goal_view(request):
    try:
        goal_id = request.POST.get('goal_id')
        goal = Organizationgoal.objects.get(id=goal_id)
        goal.delete()

        return JsonResponse({'success': True})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})





@login_required
def add_stories(request,organization_id):
    organization = Organization.objects.get(id=organization_id)
    organizationstories = Organizationstories.objects.filter(organization_id=organization_id)

    data={
             'organization':organization,
             'organizationstories':organizationstories,     
        }
    return render(request,'add_stories.html',data)

@login_required
def save_stories(request):

    if request.method == 'POST':    
        description = request.POST.get('description')
        image = request.FILES['Images'] 
        organization= request.POST.get('organization_id')
        stories = Organizationstories(description=description,image=image,organization_id=organization )
        stories.save()
        return JsonResponse({'success': 'Stories add successfuly'})
        

@require_POST
def delete_stories_view(request):
    try:
        stories_id = request.POST.get('stories_id')
        stories = Organizationstories.objects.get(id=stories_id)
        stories.delete()

        return JsonResponse({'success': True})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})



@login_required
def add_goal(request,organization_id):
    organization = Organization.objects.get(id=organization_id)
    org_goals = Organizationgoal.objects.filter(organization_id=organization_id)
    data={
             'organization':organization,
             'org_goals':org_goals,     
        }
    return render(request,'add_goal.html',data)


@login_required
def save_goal(request):

    if request.method == 'POST':    
        description = request.POST.get('description') 
        organization= request.POST.get('organization_id')
        goal = Organizationgoal(description=description,organization_id=organization )
        goal.save()
        return JsonResponse({'success': 'Stories add successfuly'})



@login_required
def donation_view(request,organization_id):
        organization = Organization.objects.get(id=organization_id)
        
        data={
             'organization':organization    
        }
        return render(request, 'donation.html',data)



@csrf_exempt  # This is used to disable CSRF protection for simplicity in this example. In a production environment, handle CSRF properly.
@login_required  # Make sure the user is logged in to access this view
def donation_save(request):
    if request.method == 'POST' :
        try:
            address = request.POST.get('address')
            donor_name = request.POST.get('donor_name')
            amount = request.POST.get('amount')
            org_id = request.POST.get('org_id')
            org_name = request.POST.get('org_name')
            status = "success"

            donor = Donor.objects.get(user=request.user)
            donor_id = donor.id
            organization_id = org_id
            organization_name = org_name
            donation = Donation(
                donor_id=donor_id,
                organization_id=organization_id,
                address=address,
                amount=amount,
                donor_name=donor_name,
                organization_name=organization_name,
            )
            donation.save()
            donormap = Donormap(donor_id=donor_id, organization_id=organization_id, status=status)
            donormap.save()
            return JsonResponse({'message': 'Thanks for donating! God bless you!.'})
        except ObjectDoesNotExist:
            return JsonResponse({'message': 'Donor Registration Needed!.'})
    else:
        return JsonResponse({'error': 'Invalid request method or not an AJAX request.'})
    




@login_required
def password(request,userid):
    ids=userid
    user = User.objects.get(id=ids)
    data = {
    'users': user
    }
    try:
        organization = Organization.objects.get(user_id=userid)
        data['organization'] = organization
    except Organization.DoesNotExist:
        data['organization'] = None

    try:
        donor = Donor.objects.get(user_id=userid)
        data['donor'] = donor
    except Donor.DoesNotExist:
        data['donor'] = None
    try :
        organization = Organization.objects.get(user_id=userid)
    except:
        donor = Donor.objects.get(user=userid)

    return render(request, 'change_password.html',data)


@login_required
def change_password(request):
    if request.method == 'POST':
        user = request.user
        old_password = request.POST.get('old_password', '')
        new_password = request.POST.get('new_password', '')
        confirm_password = request.POST.get('confirm_password', '')

        # Check old password
        if not user.check_password(old_password):
            return JsonResponse({'success': False, 'message': 'Incorrect old password'})
        
        if new_password == old_password :
            return JsonResponse({'success': False, 'message': 'New password and old password are same '})

        # Check if new password and confirm password match
        if new_password != confirm_password:
            return JsonResponse({'success': False, 'message': 'New password and confirm password do not match'})
        
        if not new_password:
            return JsonResponse({'success': False, 'message': 'New password cannot be empty'})

        # Change the password
        user.set_password(new_password)
        user.save()

        # Update session to reflect the new password
        update_session_auth_hash(request, user)

        return JsonResponse({'success': True, 'message': 'Password changed successfully'})

    return JsonResponse({'success': False, 'message': 'Invalid request'})




@require_POST
def delete_image_view(request):
    try:
        image_id = request.POST.get('image_id')
        image = Organization_multi_image.objects.get(id=image_id)
        image.delete()

        return JsonResponse({'success': True})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})






@require_POST
def delete_news_view(request):
    try:
        news_id = request.POST.get('news_id')
        news = Organizationnews.objects.get(id=news_id)
        news.delete()

        return JsonResponse({'success': True})

    except Exception as e:
        return JsonResponse({'success': False, 'error_message': str(e)})








    
