from django.shortcuts import render
from .tasks import notify_customers
import logging
import requests

logger = logging.getLogger(__name__)

def say_hello(request):
    try:
        logger.info('calling httpbin')
        response = requests.get('https://httpbin.org/delay/2')
        logger.info('received response from httpbin')
        data = response.json()
    except requests.ConnectionError:
        logger.critical('httpbin is offline')
    notify_customers.delay('Hello World')
    return render(request, 'hello.html', {'name': data})