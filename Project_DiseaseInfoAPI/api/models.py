from django.db import models

class Disease(models.Model):
    name = models.CharField(max_length=30)
    symptom = models.TextField()
    diagnosis = models.TextField()
