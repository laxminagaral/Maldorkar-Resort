# Generated by Django 3.1 on 2020-09-26 06:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('resortapp', '0016_remove_employee_emp_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='employee',
            name='emp_email',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
    ]