from django.contrib import admin
from api.models import Warehouse, Truck,  DeliveryPoint

class WarehouserAdmin(admin.ModelAdmin):
    list_display = ('id','name','location','latitude','longitude')

class TruckAdmin(admin.ModelAdmin):
    list_display = ('id','plate_number','status')

class DeliveryPointAdmin(admin.ModelAdmin):
    list_display = ('id','address','latitude','longitude','status','timestamp','requested_bottle_quantity')

admin.site.register(Warehouse, WarehouserAdmin)
admin.site.register(Truck, TruckAdmin)
admin.site.register(DeliveryPoint, DeliveryPointAdmin)