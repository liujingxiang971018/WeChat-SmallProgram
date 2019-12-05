"""bookrecommender URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    # url形式为http://127.0.0.1:8000/booksranking?page=1
    path('booksranking/',views.booksranking),
    path('bookspubnew/',views.bookspubnew),
    path('booksaddnew/',views.booksaddnew),
    path('booksaddnewimg/',views.booksaddnewimg),
    path('getdetail/',views.getdetail),
    path('getuserinfo/',views.getuserinfo),
    path('subform/',views.subform),
    path('upliketag/',views.upliketag),
    path('getcomment/',views.getcomment),
    path('searchcontent/',views.searchcontent),
    path('getrecommender/',views.getrecommender),
    path('getlikelist/',views.getlikelist),
]
