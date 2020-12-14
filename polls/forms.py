from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from polls.models import Product,Category


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )

class CategoryForm(forms.ModelForm):
    c_name = forms.CharField(label='Category Name', max_length=100)

    class Meta:
        model = Category
        fields = ('c_name', )

