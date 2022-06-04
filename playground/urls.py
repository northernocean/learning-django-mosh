from django.urls import path
from rest_framework.routers import SimpleRouter
from . import views

router = SimpleRouter()
router.register('products', views.Pro)

urlpatterns = [
    path('hello/', views.say_hello)
]
