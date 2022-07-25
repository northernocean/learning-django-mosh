from django.shortcuts import render
from .tasks import notify_customers

def say_hello(request):
    notify_customers.delay('Hello World')
    return render(request, 'hello.html', {'name': 'Mosh'})
