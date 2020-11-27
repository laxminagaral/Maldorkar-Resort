
from django.contrib import admin


# Register your models here.
from.models import Customer
from.models import Activity
from.models import Food
from.models import Booking
from.models import Package_detail
from.models import Purchase_detail
from.models import Enquiry
from.models import Employee
from.models import Designation
from.models import CustomerReview
from django.utils import timezone
from django.core.validators import ValidationError,RegexValidator
from django.core.validators import MaxValueValidator, MinValueValidator
from django import forms

alphanumeric = RegexValidator(r'^[0-9a-zA-Z]*$', 'Only alphanumeric characters are allowed.')
alphabetic = RegexValidator(r'^[a-zA-Z]*$', 'Only Letters are allowed.')
numeric = RegexValidator(r'^[0-9a-zA-Z]*$', 'Only Digits are allowed.')


class EmployeeForm(forms.ModelForm):

    emp_name = forms.CharField(max_length=10, required=True,validators=[alphabetic])   
    class Meta:
        model = Employee
        fields = ('emp_name','mobile','address','emp_email','salary','designation',"user")

        labels = {
            'emp_name':"Employee Name:",
            'mobile': "Contact Number:",
            'address':"Address:",                   
            'emp_email': "Email:",
            'salary': "Monthly Salary:",
            'designation':"Designation:"
        }

    def __init__(self, *args, **kwargs):
        super(EmployeeForm, self).__init__(*args, **kwargs)
        self.fields['emp_name'].widget.attrs.update({'class': 'form-control'})     
        self.fields['mobile'].widget.attrs.update({'class': 'form-control'})
        self.fields['address'].widget.attrs.update({'class': 'form-control'})
        self.fields['emp_email'].widget.attrs.update({'class': 'form-control'})
        self.fields['salary'].widget.attrs.update({'class': 'form-control','type':'TextInput'})
        self.fields['designation'].widget.attrs.update({'class': 'form-control'})
       

class ActivityA(admin.ModelAdmin):
    list_display = ('name','image_tag', 'description')
    list_filter = ('name', )

def change_estatus(modeladmin, request, queryset):
    queryset.update(enquiry_status = 'Replied')
    
# Action description
change_estatus.short_description = "Mark Selected Enquiry as Replied"



def change_bstatus(modeladmin, request, queryset):
    queryset.update(booking_status = 'b')
    
# Action description
change_bstatus.short_description = "Mark Selected Bookings as Booked"

def change_cstatus(modeladmin, request, queryset):
    queryset.update(booking_status = 'c')
    
# Action descripton
change_cstatus.short_description ="Mark Selected  Bookings as cancelled"

def foreign_field(field_name):
    def accessor(obj):
        val = obj
        for part in field_name.split('__'):
            val = getattr(val, part)
        return val
    accessor.__name__ = field_name
    return accessor

ff = foreign_field
class CustomerReviewA(admin.ModelAdmin):
    list_display=('customer','review_message','review_date')
        
class BookingA(admin.ModelAdmin):    
    list_display=('customer','get_packge_name','get_packge_description','get_packge_price','booking_date','number_of_people','get_booking_amount','paid_status','booking_status','mode_of_payment')
    actions=[change_bstatus,change_cstatus]
    fields=['customer','package','number_of_people','booking_date','checkin_date','booking_status','paid_status','mode_of_payment']

    def get_packge_name(self, obj):
        return obj.package.package_name
    get_packge_name.short_description = 'Package Name'
    get_packge_name.admin_order_field = 'package__package_name'

    def get_packge_description(self, obj):
        return obj.package.description
    get_packge_description.short_description = 'Package Description'
    get_packge_description.admin_order_field = 'package__description'

    def get_packge_price(self, obj):
        return obj.package.amount_per_head
    get_packge_price.short_description = 'Amount Per Person'
    get_packge_price.admin_order_field = 'amount_per_head'

    def get_booking_amount(self, obj):
        return obj.package.amount_per_head * obj.number_of_people
    get_booking_amount.short_description = 'Booking Amount'
        

class customerA(admin.ModelAdmin):
    list_display=('get_first_name','get_last_name','get_email','mobile','address','city','pincode')

    def get_first_name(self, obj):
        return obj.user.first_name
    get_first_name.short_description = 'First Name'
    get_first_name.admin_order_field = 'user__first_name'

    def get_last_name(self, obj):
        return obj.user.last_name
    get_last_name.short_description = 'Last Name'
    get_last_name.admin_order_field = 'user__last_name'

    def get_email(self, obj):
        return obj.user.email
    get_email.short_description = 'Email'
    get_email.admin_order_field = 'user__email'

class EnquiryA(admin.ModelAdmin):
    list_display=('enquiry_date','name','address','email','number_of_adults','number_of_children','enquiry_status')
    actions=[change_estatus]

class Package_detailsA(admin.ModelAdmin):
    list_display=('package_name','description','amount_per_head')
    list_filter=('package_name',)

class FoodA(admin.ModelAdmin):
     list_display=('food_name','image_tag','food_category','food_type','price_per_unit')
     
class Purchase_detailsA(admin.ModelAdmin):
    list_display=('purchase_date','purchase_description','purchase_amount')
    
class EmployeeA(admin.ModelAdmin):
    form=EmployeeForm
    list_display = ('emp_name','emp_email','get_designation', 'address','mobile','salary')    
    
    def get_designation(self, obj):
        return obj.designation.designation_name
    get_designation.short_description = 'Designation'
    get_designation.admin_order_field = 'designation__designation_name'
     
class DesignationA(admin.ModelAdmin):
    list_display = ('designation_name', 'description')
     
admin.site.register(Customer,customerA)
admin.site.register(Food,FoodA)
admin.site.register(Booking,BookingA)
admin.site.register(Package_detail,Package_detailsA)
admin.site.register(Purchase_detail,Purchase_detailsA)
admin.site.register(Enquiry,EnquiryA)
admin.site.register(Activity,ActivityA)
admin.site.register(Employee,EmployeeA)
admin.site.register(Designation,DesignationA)
admin.site.register(CustomerReview,CustomerReviewA)
admin.site.site_header="Resort Management Application"
