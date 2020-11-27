# -*- coding: utf-8 -*-

"""resortnew URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""


from django.urls import path,include
from . import views
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

from django.views.generic import TemplateView

urlpatterns = [
        path('', views.index, name='index'),
        path('', views.index, name='home'),
        path('/admin/resortapp/purchase_report', views.purchase_report,name='purchase_report'),
        path('/admin/resortapp/booking_report', views.booking_report,name='booking_report'),
        path('all_bookings', views.view_bookings, name='all_bookings'),
        path('all_enquiries', views.view_enquiries, name='all_enquiries'),
        path('confirmed_bookings', views.confirmed_bookings, name='confirmed_bookings'),
        path('canceled_bookings', views.canceled_bookings, name='canceled_bookings'),
        path('custsignup/', views.cust_signup, name='cust_signup'),
        path('custsignin/', auth_views.LoginView.as_view(redirect_authenticated_user=True, template_name='resortapp/customer_signin.html'), name='cust_signin'),
        path('packages/', views.packages, name='packages'),
        path('about/',views.about,name='about'),
        path('contact/',views.contact,name='contact'),
        path('newbooking/', views.update_booking, name = 'new-booking'),
        path('write_review/', views.write_review, name = 'write_review'),
        path('update/<int:booking_id>', views.update_booking),
        path('delete/<int:booking_id>', views.delete_booking),
        path('accounts/profile/',views.my_profile, name='account_packages'),
        path('accounts/', views.index, name='accounts_index'),
        path('accounts/packages/', views.packages, name='account_packages'),
        path('accounts/about/',views.about,name='account_about'),
        path('accounts/login/', auth_views.LoginView.as_view(redirect_authenticated_user=True, template_name='resortapp/customer_signin.html')),
        path('accounts/contact/',views.contact,name='account_contact'),
        path('resortapp/logout/', auth_views.LogoutView.as_view(next_page='home'), name='logout') ,
        path('book_now/<int:package_id>',views.new_booking,name='new_booking'),
        path('accounts/book_now/<int:package_id>',views.new_booking,name='new_booking'),
        path('accounts/confirm_bookings/<int:booking_id>',views.confirm_booking,name='confirm_booking'),
        path('accounts/cancel_booking/<int:booking_id>',views.cancel_booking,name='cancel_booking'),
        path('accounts/profile',views.my_profile,name="my_profile"),
        path('accounts/my_bookings',views.my_bookings,name="my_bookings"),
 
        # Change Password
        path('^', include('django.contrib.auth.urls'))

        
]
