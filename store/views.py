from turtle import st
from urllib import response
from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from store.models import Product
from store.serialize import ProductSerializer


@api_view()
def product_list(request):
    return Response('ok')


@api_view()
def product_detail(request, id):
    
    try:
        product = Product.objects.get(pk=id)
        serializer = ProductSerializer(product)
        result = serializer.data
        status_code = 200
    except Product.DoesNotExist as ex:
        status_code = 404
        print(ex)
    except Exception as ex:
        status_code = 500
        print(ex)
    
    if status_code == 200:
        return Response(result, status=status_code)
    return Response(status=status_code)
