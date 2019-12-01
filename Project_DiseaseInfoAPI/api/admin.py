from django.contrib import admin
from api.models import Disease

class DiseaseAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name', 'symptom', 'diagnosis')

admin.site.register(Disease, DiseaseAdmin)
