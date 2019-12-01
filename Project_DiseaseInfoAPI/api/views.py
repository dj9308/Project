from django.shortcuts import render
from .models import Disease
from django.core import serializers
from django.http import HttpResponse
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

@api_view(['GET'])
@permission_classes((IsAuthenticated,))
@authentication_classes((JSONWebTokenAuthentication,))
def data(request):
    diseases = Disease.objects.all()
    serializer = serializers.serialize('json', diseases)
    return HttpResponse(serializer, content_type='text/json-comment-filtered')

@api_view(['GET'])
@permission_classes((IsAuthenticated,))
@authentication_classes((JSONWebTokenAuthentication,))
def choose(request, pk_id):
    diseases = Disease.objects.filter(pk=pk_id)
    serializer = serializers.serialize('json', diseases)
    return HttpResponse(serializer, content_type='text/json-comment-filtered')