#!/bin/bash
echo "django app creating start [+]"
echo "special character not allow"
echo "enter django app name [>>] "
read django_app_name
echo "please enter url name"
read urlpath

python3 manage.py startapp $django_app_name
cd $django_app_name
mkdir -p templates/$django_app_name
touch templates/$django_app_name/index.html
echo  '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <h1>index page loading</h1>
   
</body>
</html>' > templates/$django_app_name/index.html

touch urls.py
echo 'from django.urls import path
from . import views

urlpatterns = [
    path("",views.homepage , name="homepage"),
]' > urls.py

echo "from django.shortcuts import render

# Create your views here.

def homepage(request):
    return render(request,'$django_app_name/index.html')" > views.py


cd ../  # come back to main directory 

