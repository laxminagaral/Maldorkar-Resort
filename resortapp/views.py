import datetime
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.http.response import HttpResponse
from django.core.validators import ValidationError
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.db.models import Q
from django.shortcuts import render 
from django.template import RequestContext
from django.contrib import messages
from django.http import JsonResponse
from django.shortcuts import render
from django.contrib.auth.decorators import user_passes_test
from django.core.mail import send_mail
from django.views.generic import TemplateView,CreateView,DetailView
from .models import Customer
from .models import Package_detail
from .models import Booking
from .models import Employee
from .models import Activity
from .models import Enquiry
from .models import Food
from .models import CustomerReview
from .models import Purchase_detail
from resortnew.settings import EMAIL_HOST_USER
from .forms import (UserForm,EnquiryCreate,BookingCreate,CustomerForm,ReviewCreate)
from django.http import HttpResponse
def index(request):    
    activities=Activity.objects.all()
    foods=Food.objects.all()
    enquiry_form = EnquiryCreate(request.POST or None)
    if enquiry_form.is_valid():
        cname=request.POST.get('name')
        recepient=request.POST.get('email')
        enquiry_form.save()
        subject = 'Maldorkar Resort - Enquiry Notification'
        message = 'Hello '+cname+', we have recived your Enquiry,we will get back you shortly'
        send_mail(subject,message, EMAIL_HOST_USER, [recepient], fail_silently = False)
        return redirect('index')
    else:
       print("Error")  
    return render(request, 'resortapp/index.html', {'activities': activities,'foods':foods,'enquiry_form':enquiry_form})
def my_profile(request):
    user=request.user
    try:
        user_type="customer"
        CustomerUser=Customer.objects.get(user_id=user.id)
        EmployeeUser=None
    except Customer.DoesNotExist:
        user_type="employee"
        CustomerUser=None
        EmployeeUser=Employee.objects.get(user_id=user.id)

    return render(request, 'resortapp/my_profile.html', {'user':user,'employee':EmployeeUser,'user_type':user_type,'customer':CustomerUser})
def view_enquiries(request):   
    enquiries=Enquiry.objects.filter(enquiry_status='pending')
    return render(request, 'resortapp/all_enquiries.html', {'enquiries':enquiries})

def view_bookings(request):   
    bookings=Booking.objects.filter(booking_status='Pending')
    return render(request, 'resortapp/all_bookings.html', {'bookings':bookings})
def confirmed_bookings(request):   
    bookings=Booking.objects.filter(booking_status='Booked')
    return render(request, 'resortapp/confirmed_bookings.html', {'bookings':bookings})
def canceled_bookings(request):   
    bookings=Booking.objects.filter(booking_status='Canceled')
    return render(request, 'resortapp/canceled_bookings.html', {'bookings':bookings})
def confirm_booking(request,booking_id):       
    bookings=Booking.objects.get(id=booking_id)
    cname=bookings.customer.user.first_name
    to_email=bookings.customer.user.email
    if request.method == "POST":        
        booking_id=request.POST.get('booking_id')
        booking_date=request.POST.get('booking_date')
        booking_status='Booked'
        number_of_people=request.POST.get('number_of_people')
        booking_amount=request.POST.get('booking_amount')
        mode_of_payment=request.POST.get("mode_of_payment")        
        Booking.objects.filter(pk=booking_id).update(booking_status=booking_status,mode_of_payment=mode_of_payment)
        subject = 'Maldorkar Resort - Booking Confirmation'
        message = 'Hello '+cname+", Your Booking on date "+booking_date+" is confirmed"
        recepient = to_email
        send_mail(subject, 
            message, EMAIL_HOST_USER, [recepient], fail_silently = False)
        return redirect('confirmed_bookings')
    return render(request, 'resortapp/confirm_booking.html', {'booking_id':booking_id,'booking':bookings})
def cancel_booking(request,booking_id):   
    bookings=Booking.objects.get(id=booking_id)
    cname=bookings.customer.user.first_name
    to_email=bookings.customer.user.email
    if request.method == "POST":        
        booking_id=request.POST.get('booking_id')        
        booking_status='Canceled'
        reason=request.POST.get('reason')
        booking_date=request.POST.get('booking_date')       
        Booking.objects.filter(pk=booking_id).update(booking_status=booking_status)
        subject = 'Maldorkar Resort - Booking Canceled'
        message = 'Hello '+cname+", Your Booking on date "+booking_date+" is canceled. Reason for Cancelation is:"+reason
        recepient = to_email
        send_mail(subject, 
            message, EMAIL_HOST_USER, [recepient], fail_silently = False)
        return redirect('canceled_bookings')
    return render(request, 'resortapp/cancel_booking.html', {'booking_id':booking_id,'booking':bookings})            
def my_bookings(request):
    user=request.user
    CustomerUser=Customer.objects.get(user_id=user.id)
    bookings=Booking.objects.filter(customer_id=CustomerUser.id)
    return render(request, 'resortapp/my_bookings.html', {'user':user,'customer':CustomerUser,'bookings':bookings})

def packages(request):
    shelf = Package_detail.objects.all()
    return render(request, 'resortapp/packages.html', {'shelf': shelf})
def about(request):
    customer_reviews = CustomerReview.objects.all()
    return render(request, 'resortapp/about.html', {'customer_reviews': customer_reviews})
def contact(request):
    shelf = Package_detail.objects.all()
    return render(request, 'resortapp/contact.html', {'shelf': shelf})
def write_review(request):
    user=request.user
    CustomerUser=Customer.objects.get(user_id=user.id)
    customer_id=CustomerUser.id
    new_review = ReviewCreate()
    if request.method == 'POST':
        cust_id=request.POST.get("customer_id")
        review_message=request.POST.get("review_message")
        new_review=CustomerReview()
        new_review.customer_id=cust_id
        new_review.review_message=review_message
        new_review.save()
        return redirect('about')
    else:
        return render(request, 'resortapp/review_form.html', {'review_form':new_review,'customer_id':customer_id})

    

def new_booking(request,package_id):
    user=request.user
    CustomerUser=Customer.objects.get(user_id=user.id)
    customer_id=CustomerUser.id
    package=Package_detail.objects.get(id=package_id)    
    package_name=package.package_name
    package_description=package.description
    amount_per_head=package.amount_per_head
    new_booking = BookingCreate()
    booking_errors=False
    booking_error_message=""
    if request.method == 'POST':
        cust_id=request.POST.get("customer_id")
        p_id=request.POST.get("package_id")
        num_people=request.POST.get("number_of_people")
        booking_amt=request.POST.get("booking_amount")
        bdate=request.POST.get("booking_date")
        my_bookings=Booking.objects.filter(customer_id=CustomerUser.id,booking_date=bdate)
        bcount=my_bookings.count()
        if bcount == 0:
            booking_errors=False
            booking_error_message=""
            new_booking=Booking()
            new_booking.customer_id=cust_id
            new_booking.package_id=p_id
            new_booking.booking_date=bdate
            new_booking.booking_amount=booking_amt
            new_booking.number_of_people=num_people
            new_booking.check_in_date=None
            new_booking.save()
            return redirect('my_bookings')
        else:
            booking_errors=True
            booking_error_message="You already have booking on same date."
            return render(request, 'resortapp/booking_form.html', {'booking_errors':booking_errors,'booking_error_message':booking_error_message,'update_booking_form':new_booking,'customer_id':customer_id,'package_id':package_id,'package':package})        
    else:
        return render(request, 'resortapp/booking_form.html', {'booking_errors':booking_errors,'booking_error_message':booking_error_message,'update_booking_form':new_booking,'customer_id':customer_id,'package_id':package_id,'package':package})
def update_booking(request, booking_id):
    booking_id = int(booking_id)
    try:
        booking_sel = Booking.objects.get(id = booking_id)
    except Booking.DoesNotExist:
        return redirect('index')
    booking_form = BookingCreate(request.POST or None, instance = booking_sel)
    if booking_form.is_valid():
       booking_form.save()
       return redirect('index')
    return render(request, 'resortapp/update_booking.html', {'update_booking_form':booking_form})
def delete_booking(request, booking_id):
    booking_id = int(booking_id)
    try:
        booking_sel = Booking.objects.get(id = booking_id)
    except Booking.DoesNotExist:
        return redirect('index')
    booking_sel.delete()
    return redirect('index')
def cust_signin(request):
    args={}
    return render(request, "resortapp/customer_signin.html",
		{'args': args})
def cust_signup(request):
        args={}
        user_form = UserForm(request.POST or None)
        customer_form = CustomerForm(request.POST or None)
        if request.method == "POST":
            user_form = UserForm(request.POST)
            customer_form = CustomerForm(request.POST)
            if user_form.is_valid() and customer_form.is_valid():
                new_user_instance = User.objects.create_user(**user_form.cleaned_data)
                new_customer_instance = customer_form.save(commit=False)
                new_customer_instance.user = new_user_instance
                new_customer_instance.save()
                login(request, authenticate(
				username=user_form.cleaned_data["username"],
				password=user_form.cleaned_data["password"]
		))
                return redirect('index')
            else:
                print("Validation Error")
                for err in user_form.errors:
                    print(err)
                for err in customer_form.errors:
                    print(err)
        args['user_form']=user_form
        args['customer_form']=customer_form
        return render(request, "resortapp/customer_signup.html",
		{'args': args,"user_form": user_form, "customer_form":customer_form})

def booking_report(request):
    if request.method == "POST":
        from_date=request.POST.get("from_date")
        to_date=request.POST.get("to_date")
        Bookings=Booking.objects.filter(booking_date__gte=from_date,booking_date__lte=to_date)
        return render(request, "admin/booking_report_view.html",{'from_date':from_date,'to_date':to_date,'bookings':Bookings})
    else:
        return render(request, "admin/booking_report.html")

def purchase_report(request):
    if request.method == "POST":
        from_date=request.POST.get("from_date")
        to_date=request.POST.get("to_date")
        Purchases=Purchase_detail.objects.filter(purchase_date__gte=from_date,purchase_date__lte=to_date)
        return render(request, "admin/purchase_report_view.html",{'from_date':from_date,'to_date':to_date,'purchases':Purchases})
    else:
        return render(request, "admin/purchase_report.html")
