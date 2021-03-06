# Generated by Django 3.1 on 2020-09-03 04:52

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import phonenumber_field.modelfields


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('resortapp', '0006_auto_20200830_1113'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employee',
            name='name',
        ),
        migrations.RemoveField(
            model_name='employee',
            name='phone_number',
        ),
        migrations.AddField(
            model_name='employee',
            name='mobile',
            field=phonenumber_field.modelfields.PhoneNumberField(default=None, max_length=128, region=None),
        ),
        migrations.AddField(
            model_name='employee',
            name='user',
            field=models.OneToOneField(default='', on_delete=django.db.models.deletion.CASCADE, related_name='employee', to='auth.user'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='booking',
            name='booking_status',
            field=models.CharField(choices=[('p', 'Pending'), ('b', 'Booked'), ('c', 'Canceled')], default='p', max_length=1),
        ),
        migrations.AlterField(
            model_name='booking',
            name='mode_of_payment',
            field=models.CharField(blank=True, choices=[('', 'Not Applicable'), ('Cash', 'Cash'), ('Debit Card', 'Debit Card'), ('Credit Card', 'Credit Card'), ('Online Transfer', 'Online Transfer'), ('Bank Deposit', 'Bank Deposit')], default='', max_length=100),
        ),
    ]
