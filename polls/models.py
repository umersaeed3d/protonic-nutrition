from django.db import models
from django.contrib.auth.models import User
from datetime import date
# Create your models here.



class Category(models.Model):

    c_id = models.AutoField(primary_key=True)
    c_name = models.CharField(max_length=50)

class Product(models.Model):

    p_id = models.AutoField(primary_key=True)
    p_name = models.CharField(max_length=50)
    p_desc = models.CharField(max_length=500)
    cat = models.ForeignKey(Category,on_delete=models.CASCADE, null=True)
    price = models.IntegerField(default=0)
    d_price = models.IntegerField(default=0)
    discount = models.IntegerField(default=0)
    image = models.ImageField(upload_to='polls/images/')


    def __str__(self):
        return self.p_name

class Order(models.Model):

    o_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=50)
    mobile = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    address = models.CharField(max_length=50)
    method = models.CharField(max_length=50)
    cardtype = models.CharField(max_length=50,null=True)
    cardname = models.CharField(max_length=50, null=True)
    cardnumber = models.CharField(max_length=50, null=True)
    expmonth = models.CharField(max_length=50, null=True)
    expyear = models.CharField(max_length=50, null=True)
    cvv = models.CharField(max_length=50, null=True)
    date = models.DateField(default=date.today())

class OrderDetails(models.Model):
    od_id = models.AutoField(primary_key=True)
    p_id = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    order_id = models.ForeignKey(Order, on_delete=models.CASCADE, null=True)
    quantity = models.CharField(max_length=50)
    price = models.CharField(max_length=50)
    user_id = models.CharField(max_length=50)

class Mail(models.Model):
    m_id = models.AutoField(primary_key=True)
    subject = models.CharField(max_length=50)
    body = models.CharField(max_length=50)
    from_email = models.CharField(max_length=50)
    to_email = models.CharField(max_length=50)
    user_id = models.CharField(max_length=50)

class Contact(models.Model):
    id = models.AutoField(primary_key=True)
    subject = models.CharField(max_length=50)
    body = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    telephone = models.CharField(max_length=50)
    name = models.CharField(max_length=50)

class Reviews(models.Model):

    r_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE, null=True)
    p_id = models.ForeignKey(Product,on_delete=models.CASCADE, null=True)
    text = models.CharField(max_length=50)

