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
        return Response(serializer.data, status=200)
    except Product.DoesNotExist as ex:
        return Response(status=404)
