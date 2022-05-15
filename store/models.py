from datetime import datetime
from random import choices
from django.db import models
from django.forms import CharField, DateField, DateTimeField

# Create your models here.
class Product(models.Model):
    title = models.CharField(max_length=255)
    description = models.CharField(max_length=4000)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    inventory = models.IntegerField()
    last_update = models.DateTimeField(auto_now=True)

class Customer(models.Model):
    MEMBERSHIP_BRONZE = 'B'
    MEMBERSHIP_SILVER = 'S'
    MEMBERSHIP_GOLD = 'G'
    MEMBERSHIP_CHOICES = [(MEMBERSHIP_BRONZE,'Bronze'),(MEMBERSHIP_SILVER,'Silver'),(MEMBERSHIP_GOLD,'Gold'),]
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=50)
    birth_date = DateField(null=True)
    membership = CharField(max_length=1, choices=MEMBERSHIP_CHOICES, default=MEMBERSHIP_BRONZE)

class Order(models.Model):
    PAYMENT_STATUS_PENDING='P'
    PAYMENT_STATUS_COMPLETE='C'
    PAYMENT_STATUS_FAILED='F'
    PAYMENT_STATUS_OPTIONS=[PAYMENT_STATUS_PENDING, PAYMENT_STATUS_COMPLETE, PAYMENT_STATUS_FAILED]
    placed_at = DateTimeField(auto_now_add=True)
    payment_status = CharField(max_length=1, choices=PAYMENT_STATUS_OPTIONS, default=PAYMENT_STATUS_PENDING)

class Address(models.Model):
    street = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)

