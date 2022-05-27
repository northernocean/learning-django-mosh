from django.shortcuts import render
from django.http import HttpResponse
from store.models import Product
from store.models import Customer
from store.models import Collection
from store.models import Order
from store.models import OrderItem

def say_hello(request):
    a = OrderItem.objects.filter(product__collection__id=3)

    for item in a:
        print(item)

    return render(request, 'hello.html', {'name': 'Mosh'})
