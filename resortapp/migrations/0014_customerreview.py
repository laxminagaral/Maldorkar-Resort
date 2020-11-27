# Generated by Django 3.0.4 on 2020-09-05 14:19

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('resortapp', '0013_food_photo'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomerReview',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('review_message', models.CharField(max_length=600)),
                ('review_date', models.DateField(default=django.utils.timezone.now, verbose_name='booking_date')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resortapp.Customer')),
            ],
        ),
    ]
