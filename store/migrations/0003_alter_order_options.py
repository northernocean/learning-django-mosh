# Generated by Django 3.2.5 on 2022-06-18 01:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0002_auto_20220618_0126'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='order',
            options={'permissions': [('cancel_order', 'can cancel an order')]},
        ),
    ]
