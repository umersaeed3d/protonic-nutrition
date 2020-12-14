"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url
from django.contrib.auth import views as auth_views
from django.urls import path
from polls import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [

url(r'^login/$', auth_views.LoginView.as_view(template_name="user_login.html"), name='login'),
url(r'^logout/$', auth_views.LogoutView.as_view(next_page='/'), {'next_page': '/'}, name='logout'),
url(r'^register/$', views.signup, name='signup'),
url(r'^products/(?P<value>\d+)/$', views.productsbyid,),
url(r'^single/(?P<value>\d+)/$', views.singleproductbyid,),
url(r'^order/(?P<value>\d+)/$', views.orderdetailsbyid,),
url(r'^category/delete/(?P<value>\d+)/$', views.categorydelete ),
url(r'^review/delete/(?P<value>\d+)/$', views.reviewdelete ),
url(r'^category/update/(?P<value>\d+)/$', views.categoryupdateform),
url(r'^product/delete/(?P<value>\d+)/$', views.productdelete ),
url(r'^product/update/(?P<value>\d+)/$', views.productupdateform),


path('dashboard', views.dashboard),
path('bmi', views.bmi),
path('mails', views.mails),
path('orders', views.orderslist),
path('reset_pass', views.user_pass_change),
path('addtocart', views.addtocart),
path('updatequantity', views.updatequantity),
path('delete', views.delete),
path('cartdata', views.cartdata),
path('review', views.reviewsubmit),
path('reviews/list', views.reviewslist),
path('all_products', views.productsall),
path('category', views.categoryform),
path('category/list', views.categorylist),
path('category/update', views.categoryupdate),
path('product', views.productform),
path('product/list', views.productlist),
path('product/update', views.productupdate),
path('about', views.about),
path('checkout', views.checkout),
path('drinks', views.drinks),
path('events', views.events,),
path('faqs', views.faqs),
path('login.html', views.login),
path('mail', views.mail),
path('allmail', views.allmails),
path('mailsubmit', views.mail_submit),
path('payment', views.payment),
path('privacy', views.privacy),
path('products.html', views.products),
path('services', views.services),
path('', views.protonic),




] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)