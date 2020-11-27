from django import forms
from django.contrib.auth.models import User
from .models import Booking
from .models import Enquiry
from .models import Customer
from .models import CustomerReview
from django.core.validators import ValidationError,RegexValidator
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils import timezone

alphanumeric = RegexValidator(r'^[0-9a-zA-Z]*$', 'Only alphanumeric characters are allowed.')
alphabetic = RegexValidator(r'^[a-zA-Z]{4}(\ )[a-zA-Z]*$', 'Only Letters are allowed.')
numeric = RegexValidator(r'^[0-9a-zA-Z]*$', 'Only Digits are allowed.')
#DataFlair
class BookingCreate(forms.ModelForm):
	class Meta:
		model = Booking
		fields = ('booking_date','number_of_people','booking_amount')

class ReviewCreate(forms.ModelForm):
	class Meta:
		model = CustomerReview
		fields = ('review_message',)


class EnquiryCreate(forms.ModelForm):
	number_of_adults = forms.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])
	number_of_children= forms.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])
	class Meta:
		model=Enquiry
		fields=('name','address','mobile','email','number_of_adults','number_of_children')
class UserForm(forms.ModelForm):
	"""
		Simple Django authentication User form for signup
	"""

	username = forms.CharField(max_length=150, required=True)
	password = forms.CharField(widget=forms.PasswordInput())	
	class Meta:
		model = User
		fields = ("first_name","last_name","email","username", "password")

	def __init__(self, *args, **kwargs):
		super(UserForm, self).__init__(*args, **kwargs)
		self.fields['first_name'].widget.attrs.update({'class': 'form-control'})
		self.fields['last_name'].widget.attrs.update({'class': 'form-control'})
		self.fields['email'].widget.attrs.update({'class': 'form-control'})
		self.fields['username'].widget.attrs.update({'class': 'form-control'})
		self.fields['password'].widget.attrs.update({'class': 'form-control'})
		
	

class CustomerForm(forms.ModelForm):
	"""
		customer form for customer managers
	"""
	
	pincode = forms.CharField(max_length=10, required=True)

	class Meta:
		model = Customer
		fields = ('mobile','address','city','pincode')

		labels = {
		    'mobile': "Contact Number:",
            'address':"Address:",  					
			'city': "City Name:",
			'pincode': "Pincode:"
		}

	def __init__(self, *args, **kwargs):
		super(CustomerForm, self).__init__(*args, **kwargs)		
		self.fields['mobile'].widget.attrs.update({'class': 'form-control'})
		self.fields['address'].widget.attrs.update({'class': 'form-control'})
		self.fields['city'].widget.attrs.update({'class': 'form-control'})
		self.fields['pincode'].widget.attrs.update({'class': 'form-control','type':'TextInput'})
		
		
