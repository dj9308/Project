import os, datetime
from decouple import config
import django_heroku

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SECRET_KEY = config('SECRET_KEY')

# 프로젝트를 실서버에 배포할 경우, False로 변경해야함
DEBUG = config('DEBUG')

ALLOWED_HOSTS = ['*'] # 모든 도메인에 대해서 허용 

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'bootstrap4',
    'rest_framework',
    'rest_framework.authtoken',
    'rest_auth',
    'django.contrib.sites',
    'allauth',
    'allauth.account',
    'rest_auth.registration',
    'main',
    'api',
    'chatbot',
]

SITE_ID = 1
REST_USE_JWT = True

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'DiseaseInfoAPI.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'DiseaseInfoAPI.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
    # pip install mysqlclient 설치 필수
    # 'default': {
    #     'ENGINE': 'django.db.backends.mysql',
    #     'NAME': '', # DB name
    #     'USER': '', # DB account
    #     'PASSWORD': '',  # DB account's password
    #     'HOST': '127.0.0.1',    # DB address(IP)
    #     'PORT': ''  # DB port
    # }
}

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


LANGUAGE_CODE = 'ko-kr'

TIME_ZONE = 'Asia/Seoul'

USE_I18N = True

USE_L10N = True

USE_TZ = False

# 웹 페이지에서 사용할 정적 파일의 최상우 URL 경로(실제 파일이 위치한 디렉토리는 아님)
STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(BASE_DIR, 'static')

STATICFILES_DIRS = [
    # 정적 파일이 위치한 경로
    # 쉼표(,)를 빠뜨리게 되면 에러가 납니다. django_blog/assets/ 로 가서 정적 파일이 있는지 찾는다.
    # os.path.join(BASE_DIR, 'DJANGO_BLOG', 'assets', )
]

# STATIC_URL과 비슷, 업로드된 파일의 주소(URL)을 만들어 줌(실제 이미지 파일이 업로드 된 디렉토리를 의미하는 것은 아님)
MEDIA_URL = '/media/'

# STATICFILES_DIRS 동일한 기능, 정적 파일의 업로드가 끝나면 파일이 어디에 저장될 지를 설정하는 경로
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

REST_FRAMEWORK = {
    # 로그인 여부를 확인하는 클래스
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    # 로그인과 관련된 클래스
    'DEFAULT_AUTHENTICATION_CLASSES': (
        # JWT를 사용하기
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.BasicAuthentication',
        'rest_framework.authentication.TokenAuthentication',
    )
}

ACCOUNT_EMAIL_REQUIRED = False
ACCOUNT_EMAIL_VERIFICATION = None

JWT_AUTH = {
    # JWT의 비밀키를 어떤걸 사용할지 결정. 현재는 장고와 같은 키 사용. 실제 사용시에는 다른 키 사용 권장
    # 그렇다면 어떤 키를 사용하는지와 생성하는지 의문!
    'JWT_SECRET_KEY': SECRET_KEY,
    # 암호화에 사용되는 알고리즘 지정
    'JWT_ALGORITHM': 'HS256',
    # JWT 토큰을 갱신할 수 있게 할지 여부를 결정
    'JWT_ALLOW_REFRESH': True,
    # JWT 토큰의 유효기간 설정
    'JWT_EXPIRATION_DELTA': datetime.timedelta(seconds=600),
    # JWT 토큰 갱신의 유효기간 설정
    'JWT_REFRESH_EXPIRATION_DELTA': datetime.timedelta(seconds=200),
}

django_heroku.settings(locals())
