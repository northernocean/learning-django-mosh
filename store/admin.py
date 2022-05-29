from django.contrib import admin
from django.contrib import messages
from django.http import HttpRequest
from django.db.models import Count
from django.urls import reverse
from django.utils.html import format_html, urlencode
from . import models


class InventoryFilter(admin.SimpleListFilter):
    title = 'inventory'
    parameter_name = 'inventory'

    def lookups(self, request, model_admin):
        return [('<10', 'Low')]
    
    def queryset(self, request, queryset):
        if self.value() == '<10':
            return queryset.filter(inventory__lt=10)


# --------
# CUSTOMER
# --------
@admin.register(models.Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ['last_name', 'first_name', 'membership','orders']
    ordering = ['last_name', 'first_name']
    list_editable = ['membership']
    list_per_page = 10
    search_fields = ['first_name__istartswith', 'last_name__istartswith'] 

    @admin.display(ordering='orders_count')
    def orders(self, customer):
        url = (
            reverse('admin:store_order_changelist')
            + '?'
            + urlencode({
                'customer__id': str(customer.id)
            }))
        return format_html('<a href="{}">{} Orders</a>', url, customer.orders_count)

    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            orders_count=Count('order'))        

# ----------
# COLLECTION
# ----------
@admin.register(models.Collection)
class CollectionAdmin(admin.ModelAdmin):
    list_display = ['title', 'products_count']
    search_fields = ['title']

    @admin.display(ordering='products_count')
    def products_count(self, collection):
        url = (
            reverse(
            'admin:store_product_changelist')
            + '?'
            + urlencode({'collection__id': str(collection.id)})
            )
        return format_html('<a href="{}">{}</a>', url, collection.products_count)
    
    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            products_count = Count('product')
        )

# -----
# ORDER
# ----- 

class OrderItemInline(admin.StackedInline):
    autocomplete_fields = ['product']
    #min_num = 1
    #max_num = 10
    model = models.OrderItem

    extra = 0

@admin.register(models.Order)
class OrderAdmin(admin.ModelAdmin):
    autocomplete_fields = ['customer']
    inlines = [OrderItemInline]
    list_display = ['id', 'placed_at', 'customer']
    list_per_page = 20
    #list_select_related = ['customer']

# -------
# PRODUCT
# -------
@admin.register(models.Product)
class ProductAdmin(admin.ModelAdmin):
    autocomplete_fields = ['collection']
    prepopulated_fields = {
        'slug': ['title']
    }
    actions = ['clear_inventory']
    list_display = ['title', 'unit_price', 'inventory_status', 'collection_title']
    list_editable = ['unit_price']
    list_per_page = 20
    list_select_related = ['collection']
    list_filter = ['collection', 'last_update', InventoryFilter]
    search_fields = ['title']

    def collection_title(self, product):
        return product.collection.title

    @admin.display(ordering='inventory')
    def inventory_status(self, product):
        if product.inventory < 10:
            return 'Low'
        return 'OK'

    @admin.action(description='Clear Inventory')
    def clear_inventory(self, request, queryset):
        updated_count = queryset.update(inventory=0)
        self.message_user(
            request, 
            f'{updated_count} products {"was" if updated_count == 1 else "were"} updated',
            messages.INFO)

