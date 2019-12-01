from django.shortcuts import render, redirect, get_object_or_404
from telegram.ext import Updater, MessageHandler, Filters
from django.http import StreamingHttpResponse, HttpResponse
from decouple import config
import requests
from pprint import pprint as pp
from django.views.decorators.http import require_POST
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from api.models import Disease

base = "https://api.telegram.org"
token = config('TOKEN')
chat_id = config('CHATID')


@csrf_exempt
def webhook(request, telegram_token):
    url = f'{base}/bot{telegram_token}/setWebhook?url=https://diseaseinfoapi.herokuapp.com/{telegram_token}'
    requests.get(url).json()
    body = request.body
    body = body.decode('utf-8')
    res = json.loads(body)

    if res.get('message'):
        text = res.get('message').get('text')
        username = res.get('message').get('from').get('last_name') + res.get('message').get('from').get('first_name')
        method = 'sendMessage'
        if Disease.objects.filter(name=text).exists():
            index = Disease.objects.get(name=text).pk
            data = {
                'username': username,
                'password': 'qlalfqjsgh',
            }
            res = requests.post(config('URL_GENERATE'), data=data).json()
            headers = {
                'Authorization': 'jwt ' + res.get('token'),
            }
            url_data = config('URL_DATA')
            getData = requests.get(f'{url_data}/{index}/', headers=headers).json()
            text = '[증상] : ' + getData[0].get('fields').get('symptom') + '\n\n[진단] : ' + getData[0].get('fields').get('diagnosis')
        else:
            db = '[ '
            for value in Disease.objects.all():
                db += value.name + ' '
            db += ' ]'
            text = f'해당 키워드에 일치하는 정보가 없습니다. \n{db}'
        url = f'{base}/bot{token}/{method}?chat_id={chat_id}&text={text}'
        requests.get(url)
    return HttpResponse(f'/{telegram_token}')

