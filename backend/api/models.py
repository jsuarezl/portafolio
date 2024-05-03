from django.db import models

# Create your models here.
class Warehouse(models.Model):

    id = models.CharField(primary_key=True, max_length=100)
    name = models.CharField(max_length=100,blank=True, null=True)
    location = models.CharField(max_length=255,blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)


class Truck(models.Model):
    CHOICES = {
        'available':'AVAILABLE',
        'on_route':'ON ROUTE',
        'out_of_service':'OUT OF SERVICE'
    }
    id= models.CharField(primary_key=True, max_length=100)
    plate_number = models.CharField(max_length=20,blank=True, null=True)
    model = models.CharField(max_length=50,blank=True, null=True)
    bottle_capacity = models.IntegerField(blank=True,null=True)
    status = models.CharField(max_length=20,blank=True, null=True,choices=CHOICES)
    stock_quantity = models.IntegerField(blank=True,null=True)
class Stock(models.Model):
    id= models.CharField(primary_key=True, max_length=100)
    bottle_quantity = models.IntegerField(blank=True, null=True)
    update_date = models.DateTimeField(blank=True, null=True)

class Route(models.Model):
    id= models.CharField(primary_key=True, max_length=100)
    estimated_duration = models.DateTimeField(blank=True, null=True)
    distance = models.FloatField(blank=True, null=True)
    creation_date = models.DateField(blank=True, null=True)

class DeliveryPoint(models.Model):
    CHOICES = {
        'active':'ACTIVATE',
        'inactive':'INACTIVE'
    }
    id= models.CharField(primary_key=True, max_length=100)
    address = models.CharField(max_length=100,blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    status = models.CharField(max_length=20,blank=True, null=True,choices=CHOICES)
    timestamp = models.DateTimeField(blank=True, null= True)
    requested_bottle_quantity = models.IntegerField(blank=True, null=True)

class Order(models.Model):
    CHOICES = {
        'pending':'PENDING',
        'in_progress':'IN PROGRESS',
        'delivered':'DELIVERED'
    }
    id= models.CharField(primary_key=True, max_length=100)
    status = models.CharField(max_length=20,blank=True, null=True,choices=CHOICES)
    order_date = models.DateTimeField(blank=True, null=True)
    
