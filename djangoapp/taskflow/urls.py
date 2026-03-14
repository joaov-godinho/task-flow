from django.urls import path
from taskflow.views import index

app_name = 'taskflow'

urlpatterns = [
    #taskflow:index
    path('', index, name='index'),
]