from django.db import models
from django.core.validators import RegexValidator
from phonenumber_field.modelfields import PhoneNumberField
from django.forms import ModelForm
from django import forms
from datetime import datetime
import logging
import traceback
from django.db.models import Q
from django.utils.translation import ugettext as _
from django.utils import timezone
from django.contrib.auth.models import User
from django.conf import settings
from django.dispatch import receiver
from django.urls import reverse
from django.core.validators import ValidationError
from django.db.models.signals import post_save
from django.utils import timezone
from django.utils.html import mark_safe

Statuses=[
    ('Pending','Pending'),
    ('Booked','Booked'),
    ('Canceled','Canceled')
    
]
Pstatuses=[
    ('Paid','Paid'),
    ('Unpaid','Unpaid')
]
pmodes=[
    ('','Not Applicable'),
    ('Cash','Cash'),
    ('Debit Card','Debit Card'),
    ('Credit Card','Credit Card'),
    ('Online Transfer','Online Transfer'),
    ('Bank Deposit','Bank Deposit')
]

class Designation(models.Model):
    designation_name=models.CharField(max_length=60)
    description=models.CharField(max_length=200)
    def __str__(self):
        return f"{self.designation_name}"
# Create your models here.
class Customer(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE,related_name='customer')
    address=models.CharField(max_length=200)    
    mobile=PhoneNumberField()
    city=models.CharField(max_length=200)
    pincode=models.PositiveIntegerField(default=0,blank=True)
    def __str__(self):
        return f"{self.user.first_name}, {self.user.last_name}"

class Food(models.Model):
    food_name=models.CharField(max_length=200)
    food_category=models.CharField(max_length=100)
    food_type=models.CharField(max_length=100)
    price_per_unit=models.FloatField(default=0)
    photo=models.ImageField()
    def image_tag(self):
        return mark_safe('<img src="/media/%s" width="150" height="150"/>' % (self.photo))
    image_tag.short_description='Image'


class Package_detail(models.Model):
    package_name=models.CharField(max_length=100)
    description=models.CharField(max_length=10000)
    amount_per_head=models.PositiveIntegerField(default=0)
    def __str__(self):
        return f"{self.package_name}"

class CustomerReview(models.Model):
    customer=models.ForeignKey('resortapp.Customer',on_delete=models.CASCADE)
    review_message=models.CharField(max_length=600,blank=False)
    review_date=models.DateField('review_date',default=timezone.now)

class Booking(models.Model):
    customer=models.ForeignKey('resortapp.Customer',on_delete=models.CASCADE)
    package=models.ForeignKey('resortapp.Package_detail',on_delete=models.CASCADE)
    booking_date=models.DateField('booking_date',default=timezone.now)
    checkin_date=models.DateTimeField('check_in_time',blank=True)
    checkout_date=models.DateTimeField('check_out_date',blank=True)
    number_of_people=models.PositiveIntegerField(default=0)
    booking_amount=models.PositiveIntegerField(default=0)
    paid_status=models.CharField(max_length=100,choices=Pstatuses,default='Unpaid')
    booking_status=models.CharField(max_length = 20,choices=Statuses,default='Pending')
    mode_of_payment=models.CharField(max_length=100,choices=pmodes,default='',blank=True)    

class Purchase_detail(models.Model):
    purchase_date=models.DateTimeField('purchase date')
    purchase_description=models.CharField(max_length=100)
    purchase_amount=models.PositiveIntegerField(default=0)
    

class Enquiry(models.Model):
    enquiry_date=models.DateTimeField(default=datetime.now,blank=True)
    name=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    mobile=PhoneNumberField()
    email=models.CharField(max_length=100)
    number_of_adults=models.PositiveIntegerField(default=0)
    number_of_children=models.PositiveIntegerField(default=0)
    enquiry_status=models.CharField(max_length=100,default='pending')
    

class Activity(models.Model):
    name=models.CharField(max_length=100)
    description=models.CharField(max_length=100)
    photo=models.ImageField()
    def image_tag(self):
        return mark_safe('<img src="/media/%s" width="150" height="150"/>' % (self.photo))
    image_tag.short_description='Image'

class Employee(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE,related_name='employee') 
    emp_name=models.CharField(max_length=100)
    emp_email=models.CharField(max_length=100)
    designation=models.ForeignKey('resortapp.Designation',on_delete=models.CASCADE)  
    address=models.CharField(max_length=100)
    mobile=PhoneNumberField(default=None)
    salary=models.PositiveIntegerField(default=0)