from django.shortcuts import render, redirect, get_object_or_404
from api.models import Disease
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django.contrib.sessions.models import Session

def index(request):
    return render(request, 'main/index.html')
    
def register(request):
    return render(request, 'main/register.html')

def login(request):
    return render(request, 'main/login.html')
    
def tables(request):
    diseases = Disease.objects.all()
    return render(request, 'main/tables.html', {'diseases':diseases})
