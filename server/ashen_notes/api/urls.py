from django.urls import path
from . import views


urlpatterns = [
    path('', views.get_routes),
    path('notes/', views.get_notes),
    path('notes/create/', views.create_note),
    path('notes/<str:id>/update/', views.update_note),
    path('notes/<str:id>/delete/', views.delete_note),
    path('notes/<str:id>/', views.get_note),
]