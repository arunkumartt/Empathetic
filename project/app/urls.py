
from django.urls import path
from . import views


urlpatterns = [
    path('',views.home,name='home'),
    path('home',views.home,name='home'),


    path('about',views.about,name='about'),


    path('gallery',views.gallery,name='gallery'),


    path('contact',views.contact,name='contact'),


    path('register',views.register,name='register'),


    path('organizationreg',views.organizationreg,name='organizationreg'),

    path('orgsave',views.orgsave,name='orgsave'),


    path('donerregistration',views.donerregistration,name='donerregistration'),


    path('login',views.user_login,name='login'),


    path('profile',views.profile,name='profile'),


    path('logout',views.user_logout,name='logout'),


    path('organization_list',views.organization_list,name='organization_list'),
    
    
    path('add_news/<int:organization_id>/',views.add_news,name='add_news'),

    path('save_news',views.save_news,name='save_news'),

    path('delete_news/', views.delete_news_view, name='delete_news'),


    path('add_image/<int:organization_id>/',views.add_image,name='add_image'),

    path('addimagesave', views.addimagesave, name='addimagesave'),

    path('upload_image/', views.upload_image, name='upload_image'),

    path('upload_multipleimage/', views.upload_multipleimage, name='upload_multipleimage'),

    path('delete_image/', views.delete_image_view, name='delete_image'),

    path('delete_uploaded_image/', views.delete_uploaded_image_view, name='delete_uploaded_image'),



    path('add_stories/<int:organization_id>/',views.add_stories,name='add_stories'),

    path('save_stories',views.save_stories,name='save_stories'),

    path('delete_stories/', views.delete_stories_view, name='delete_stories'),


    
    path('add_goal/<int:organization_id>/',views.add_goal,name='add_goal'),

    path('save_goal',views.save_goal,name='save_goal'),

    path('delete_goal/', views.delete_goal_view, name='delete_goal'),



    path('update_organization/<int:user_id>/',views.update_organization,name='update_organization'),

    path('updateorganization/',views.updateorganization,name='updateorganization'),


    path('update_donor/<int:user_id>/',views.update_donor,name='update_donor'),

    path('update',views.update,name='update'),

    
    path('notificationorganization/<int:organization_id>/',views.notificationorganization,name='notificationorganization'),


    path('notificationdonor/<int:donor_id>/',views.notificationdonor,name='notificationdonor'),


    path('delete_account/<int:user_id>/',views.delete_account,name='delete_account'),

    path('delete_user', views.delete_user, name='delete_user'),

    
    path('organizationsingle/<int:organization_id>/', views.organizationsingle, name='organizationsingle'),


    path('donate/<int:organization_id>', views.donation_view, name='donate'),
    
    path('donation_save/', views.donation_save, name='donation_save'),
    

    path('password/<int:userid>/',views.password,name='password'),

    path('change_password/',views.change_password,name='change_password'),

    

]
