from django.shortcuts import render,redirect
from .models import Product,Category,Reviews,Order,OrderDetails,Mail,Contact
from django.contrib.auth.models import User
from polls.forms import SignUpForm,CategoryForm
from django.contrib.auth import login, authenticate
from django.contrib import messages
from django.http import HttpResponse
import json
from django.core.mail import send_mail
from datetime import date
from django.contrib.auth.hashers import make_password, check_password

from django.core.files.storage import FileSystemStorage

# Create your views here.
def protonic(request):
    products = Product.objects.filter(discount__gt=0)[:8]
    c = Category.objects.all()
    params={'product':products,'category':c}
    return render(request,'protonic.html', params)

def bmi(request):
    weight = float(request.POST.get('weight'))
    budget = float(request.POST.get('budget'))
    height = float(request.POST.get('height'))
    bmi = weight/(height/100*height/100)

    if bmi<18.5:
        gainer = Product.objects.filter(cat_id=2).filter(d_price__lt=budget)[:10]
        preworkout = Product.objects.filter(cat_id=5).filter(d_price__lt=budget)[:10]
        bcaa = Product.objects.filter(cat_id=3).filter(d_price__lt=budget)[:10]
        vitamin = Product.objects.filter(cat_id=7).filter(d_price__lt=budget)[:10]
        c = Category.objects.all()
        params={'gainers':gainer,'preworkouts':preworkout,'bcaas':bcaa,'vitamins':vitamin,'category':c,'plan':'gaining.pdf','status':'According to our recommendation system, you are skinny, For gaining muscle mass,we have suggested you a diet plan which you can download below'}

    elif bmi>=18.5 and bmi<=24.9:
        whey = Product.objects.filter(cat_id=4).filter(d_price__lt=budget)[:10]
        preworkout = Product.objects.filter(cat_id=5).filter(d_price__lt=budget)[:10]
        bcaa = Product.objects.filter(cat_id=3).filter(d_price__lt=budget)[:10]
        vitamin = Product.objects.filter(cat_id=7).filter(d_price__lt=budget)[:10]
        c = Category.objects.all()
        params = {'wheys': whey, 'preworkouts': preworkout, 'bcaas': bcaa, 'vitamins': vitamin,'category':c,'plan':'gaining.pdf','status':'According to our recommendation system, you are normal weight but for gaining muscle mass,we have suggested you a diet plan which you can download below'}
    else:
        whey = Product.objects.filter(cat_id=4).filter(d_price__lt=budget)[:10]
        preworkout = Product.objects.filter(cat_id=5).filter(d_price__lt=budget)[:10]
        bcaa = Product.objects.filter(cat_id=3).filter(d_price__lt=budget)[:10]
        vitamin = Product.objects.filter(cat_id=7).filter(d_price__lt=budget)[:10]
        fatburner = Product.objects.filter(cat_id=6).filter(d_price__lt=budget)[:10]
        c = Category.objects.all()
        params = {'wheys': whey, 'preworkouts': preworkout, 'bcaas': bcaa, 'vitamins': vitamin,'fatburners':fatburner,'category':c,'plan':'cutting.pdf','status':'According to our recommendation system, you are overweight, For fatloss,we have suggested you a diet plan which you can download below'}
    return render(request,'recommendation.html',params)

def reviewsubmit(request):
    if request.user.is_authenticated:

        pro = Product.objects.get(p_id=request.POST.get('product_id'))
        check = OrderDetails.objects.filter(p_id=pro).filter(user_id=request.user.id)
        if check:
            user = User.objects.get(id=request.user.id)
            review = Reviews(text=request.POST.get('review'),user_id=user,p_id=pro)
            review.save()
            messages.success(request, 'Thanks for Posting A Review :)')
            return redirect('/')
        else:
            messages.warning(request, 'For this review, you have to purchase this product first')
            return redirect('/')
    else:
        return redirect('/login')
def reviewslist(request):
    reviews = Reviews.objects.select_related('p_id')
    return  render(request,'reviews_list.html',{'table':reviews})

def orderslist(request):
    order = Order.objects.select_related('user_id')
    return  render(request,'order_list.html',{'table':order})

def orderdetailsbyid(request,value):
    order = OrderDetails.objects.select_related('p_id').filter(order_id=value)
    return  render(request,'order_details.html',{'table':order})

def reviewdelete(request, value):
    Reviews.objects.filter(r_id=value).delete()
    messages.warning(request, 'Review is Deleted!')
    return redirect('/reviews/list')


def productsbyid(request,value):
    products = Product.objects.select_related('cat').filter(cat=value)
    c = Category.objects.all()

    params = {'product': products, 'category': c}

    return render(request,'products.html', params)

def mail_submit(request):
    name = request.POST.get('name')
    email = request.POST.get('email')
    telephone = request.POST.get('telephone')
    subject = request.POST.get('subject')
    body = request.POST.get('body')

    contact = Contact(name=name,email=email,telephone=telephone,subject=subject,body=body)
    contact.save()

    messages.success(request, 'Your message has been delivered. You will be contacted shortly Via Sms')
    return redirect('/')


def singleproductbyid(request,value):
    p = Product.objects.select_related('cat')
    product = Product.objects.select_related('cat').get(p_id=value)
    c = Category.objects.all()
    reviews = Reviews.objects.filter(p_id=value)

    params = {'p': product, 'category': c,'products':p,'reviews':reviews}

    return render(request,'single.html', params)

def cartdata(request):
    if 'cart' in request.session:
        return HttpResponse(json.dumps(request.session['cart']), content_type="application/json")
    else:
        return 'Your Cart is empty, Please Shop :)'

def mails(request):

    mail = Mail.objects.all()
    return render(request,'mail_list.html',{'mail':mail})

def updatequantity(request):
    # del request.session['cart']
    id = request.GET.get('id')
    value = request.GET.get('value')
    cart = request.session['cart']
    for i in range(0,len(request.session['cart'])):
        if cart[i][0]==id:
            cart[i][4]=value

            # cart[i][5] = cart[i][5]*int(value)
            request.session['cart'] = cart
        else:
            continue
    return HttpResponse(json.dumps(request.session['cart']), content_type="application/json")

def delete(request):
    # del request.session['cart']
    id = request.GET.get('id')
    cart = request.session['cart']
    if len(cart)==1:
        r=len(cart)
    else:
        r=len(cart)-1
    # print(cart)
    for i in range(0,r):
        if cart[i][0]==id:
            del request.session['cart'][i]
            request.session['cart'] = cart
        else:
            continue

    return HttpResponse(json.dumps(request.session['cart']), content_type="application/json")

def addtocart(request):
    # del request.session['cart']
    id = request.GET.get('id')
    pro = Product.objects.get(p_id=id)
    # string = '<tr><td data-th="Product"><div class="row"><div class="col-sm-2 hidden-xs"><img src="/media/'+str(pro.image)+'" alt="..." class="img-responsive"/></div><div class="col-sm-10"><h4 class="nomargin">'+str(pro.p_name)+'</h4><p> '+pro.p_desc+'</p></div></div></td><td data-th="Price">Rs '+str(pro.d_price)+'</td><td data-th="Quantity"><input type="number" class="form-control text-center" value="1" ></td><td data-th="Subtotal" class="text-center">Rs '+str(pro.d_price)+'</td><td class="actions" data-th=""><button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button><button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button></td></tr>'
    if 'cart' in request.session:

        cart = request.session['cart']
        new = [id,str(pro.image),pro.p_name,pro.p_desc,'1',pro.d_price]
        cart.append(new)
        request.session['cart']=cart
    else:
        new = [id, str(pro.image), pro.p_name, pro.p_desc, '1', pro.d_price]

        request.session['cart'] = [new]

    return HttpResponse(json.dumps(request.session['cart']),content_type="application/json")

def productsall(request):
    products = Product.objects.select_related('cat')
    c = Category.objects.all()
    params = {'product': products, 'category': c}

    return render(request,'products.html', params)

def about(request):

    products = Product.objects.all()
    c = Category.objects.all()
    params = {'product': products,'category':c}
    print(products)
    return render(request,'about.html', params)


def checkout(request):
    products = Product.objects.all()
    cat = Category.objects.all()
    print(request.session['cart'])
    params = {'product': products,'cat':cat,'cart':request.session['cart'],'length':len(request.session['cart'])}

    return render(request,'checkout.html', params)

def drinks(request):
    products = Product.objects.all()
    params = {'product': products}
    print(products)
    return render(request,'drinks.html', params)

def events(request):
    products = Product.objects.all()
    params = {'product': products}
    print(products)
    return render(request,'events.html', params)

def faqs(request):
    products = Product.objects.all()
    c = Category.objects.all()
    params = {'product': products,'category':c}

    return render(request,'faqs.html', params)



def mail(request):
    products = Product.objects.all()
    c = Category.objects.all()
    params = {'product': products,'category':c}

    return render(request,'mail.html', params)

def payment(request):
    if request.user.is_authenticated:
        user = User.objects.get(id=request.user.id)
        order = Order(cardtype=request.POST.get('cardtype'),cardname=request.POST.get('cardname'),cardnumber=request.POST.get('cardnumber'),expmonth=request.POST.get('expmonth'),expyear=request.POST.get('expyear'),cvv=request.POST.get('cvv'),method=request.POST.get('method'),name=request.POST.get('name'),address=request.POST.get('address'),mobile=request.POST.get('mobile'),city=request.POST.get('city'),email=request.POST.get('email'),user_id=user)
        order.save()
        latest = Order.objects.latest('o_id')
        orid = Order.objects.get(o_id=latest.o_id)
        for i in range(0,len(request.session['cart'])):
            pro = Product.objects.get(p_id=request.session['cart'][i][0])
            order_detail = OrderDetails(order_id=orid,user_id=request.user.id,p_id=pro,quantity=request.session['cart'][i][4],price=request.session['cart'][i][5])
            order_detail.save()

        messages.success(request, 'Order is confirmed. Thank you for shopping')
        del request.session['cart']
        mail = Mail(subject='Order Confirmation At Protonic Nutrition',body='<h1 style="text-align:center">Thank you for shopping at Protonic Nutrition</h1><h3>Your order no. is: '+str(latest.o_id)+'</h3><span>Date: '+str(date.today())+'</span>',from_email='protonicnutrition@gmail.com',to_email=request.POST.get('email'))
        mail.save()
        # send_mail(
        #     'Order Is Confirmed',
        #     '<h1 style="text-align:center">Thank you for shopping at Protonic Nutrition</h1>'
        #     '<h3>Your order no. is: '+str(latest.o_id)+'</h3>'
        #     '<span>Date: '+str(date.today())+'</span>.',
        #     'protonicnutrition@gmail.com',
        #     [request.POST.get('email')],
        #     fail_silently=False,
        # )
        return redirect('/')
    else:
        return redirect('/login')


def privacy(request):
    products = Product.objects.all()
    params = {'product': products}
    print(products)
    return render(request,'privacy.html', params)

def products(request):
    products = Product.objects.all()
    params = {'product': products}
    print(products)
    return render(request,'products.html', params)

def services(request):
    products = Product.objects.all()
    params = {'product': products}
    print(products)
    return render(request,'services.html', params)



def user_login(request):
    products = Product.objects.all()
    params = {'product': products}
    print(products)
    return render(request,'user_login.html')




def user_pass_change(request):
    hash_pass_old = request.POST.get('old_pass')
    hash_pass_new = make_password(request.POST.get('new_pass'))
    username = request.POST.get('username')
    user = User.objects.get(username=username)
    if user:
        check = user.check_password(hash_pass_old)

        if check:
            User.objects.filter(username=username).update(password=hash_pass_new)
            messages.success(request, 'Password changed !')
            return redirect('/login')
        else:
            messages.warning(request, 'Wrong old password')
            return redirect('/login')
    else:
        messages.warning(request, 'Invalid Username !')
        return redirect('/login')



def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request,user)
            return redirect('/')
        else:
            return render(request, 'user_register.html', {'form': form})
    else:
        cat = Category.objects.all
        form = SignUpForm()

        return render(request, 'user_register.html', {'form': form,'category':cat})


def dashboard(request):
    if request.user.is_superuser:

        return render(request, 'home.html')
    else:
        return redirect('/')

def categoryform(request):
    if request.method=='POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,'Category is created')

            return redirect('/category')
    else:
        form = CategoryForm()
        return render(request,'category_form.html',{'form': form})
def allmails(request):
    contact = Contact.objects.all();
    return  render(request,'mails_list.html',{'table':contact})

def categorylist(request):
    category = Category.objects.all();
    return  render(request,'category_list.html',{'table':category})



def categorydelete(request, value):
    Category.objects.filter(c_id=value).delete()
    messages.warning(request, 'Category is Deleted!')
    return redirect('/category/list')


def categoryupdateform(request, value):
    table = Category.objects.get(c_id=value)
    return render(request,'category_update.html',{'table':table})


def categoryupdate(request):
    Category.objects.filter(c_id=request.POST.get('id')).update(c_name=request.POST.get('name'))
    messages.success(request, 'Category is Updated!')
    return redirect('/category/list')

def productform(request):
    if request.method=='POST':
        myfile = request.FILES['image']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)
        c = Category.objects.get(c_id=request.POST.get('cat_id'))
        product = Product(p_name=request.POST.get('name'),p_desc=request.POST.get('desc'),cat=c,price=request.POST.get('price'),d_price=request.POST.get('d_price'),discount=request.POST.get('discount'),image=filename)
        product.save()
        messages.success(request, 'Product is created')
        return redirect('/product')
    else:
        cat = Category.objects.all()
        return render(request,'product_form.html',{'cat':cat})
def productlist(request):
    product = Product.objects.select_related('cat');
    return  render(request,'product_list.html',{'table':product})

def productdelete(request, value):
    Product.objects.filter(p_id=value).delete()
    messages.warning(request, 'Product is Deleted!')
    return redirect('/product/list')
def productupdateform(request, value):
    table = Product.objects.get(p_id=value)
    return render(request,'product_update.html',{'table':table})
def productupdate(request):
    Product.objects.filter(p_id=request.POST.get('id')).update(p_name=request.POST.get('name'),p_desc=request.POST.get('desc'),price=request.POST.get('price'),d_price=request.POST.get('d_price'),discount=request.POST.get('discount'))
    messages.success(request, 'Product is Updated!')
    return redirect('/product/list')