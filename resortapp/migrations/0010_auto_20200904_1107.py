# Generated by Django 3.0.4 on 2020-09-04 05:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('resortapp', '0009_auto_20200903_1621'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='salary',
            field=models.PositiveIntegerField(default=0),
        ),
    ]