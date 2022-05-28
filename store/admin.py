from csv import list_dialects
from django.contrib import admin
from . import models

@admin.register(models.Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['title', 'unit_price', 'inventory_status', 'collection_title']
    list_editable = ['unit_price']
    list_per_page = 20
    list_select_related = ['collection']

    def collection_title(self, product):
        return product.collection.title

    @admin.display(ordering='inventory')
    def inventory_status(self, product):
        if product.inventory < 10:
            return 'Low'
        return 'OK'

@admin.register(models.Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ['last_name', 'first_name', 'membership']
    ordering = ['last_name', 'first_name']
    list_editable = ['membership']
    list_per_page: 10

admin.site.register(models.Collection)


@admin.register(models.Order)
class OrderAdmin(admin.ModelAdmin):
    list_per_page = 20
    list_select_related = ['customer']
