from django.urls import path
from plant import views

urlpatterns = [
    path('plant_detection', views.PlantDetectionSerializerAPIView.as_view(),name='plant_detection'),

]