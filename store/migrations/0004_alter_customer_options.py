# Generated by Django 3.2.5 on 2022-06-19 16:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0003_alter_order_options'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='customer',
            options={'ordering': ['user__first_name', 'user__last_name'], 'permissions': [('view_history', 'can view history')]},
        ),
    ]
