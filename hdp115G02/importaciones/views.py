from django.shortcuts import render
from django.http import HttpResponse
import json
from django.db import IntegrityError
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from importaciones.models import *
from django.core import serializers
from django.core.exceptions import ValidationError

# Create your views here.
def plantilla(request):
    return render(request,'importaciones/plantilla.html')


@login_required
def info(request):
    return render(request, 'importaciones/informacion.html')

@login_required
def agregarDatos(request):
    return render(request, 'importaciones/agregarDatos.html')


@login_required
def consultar(request):
    opciones = ['Importacion', 'Exportacion', 'Balanza Comercial', 'PIB']
    Context = {'lista_opciones': opciones}
    return render(request, 'importaciones/consultar.html', Context)

@login_required
def formulas(request):
    return render(request, 'importaciones/formulas.html')

@login_required
def agregarIndi(request):
    productos= Producto.objects.all()
    return render(request, 'importaciones/agregarIndividual.html', {'productos': productos})

@login_required
def graficar(request):
    return render(request, 'importaciones/graficar.html')

def habilitarConsulta(request):
    if request.is_ajax() or request.method == 'POST':
        opc = request.POST.get('opc')

        if opc == '1' or opc == '2' or opc == '3':
            resultado = Periodoanual.objects.all()
            anios = serializers.serialize('json', resultado)
            #meses = [mes.as_json() for mes in resultado]
        else:
            anios = "pib"

    return HttpResponse(json.dumps(anios),
            content_type="application/json");



def habilitarAgregarId(request):
    if request.is_ajax() or request.method == 'POST':
        opc = request.POST.get('row')
        resultado = Periodoanual.objects.all()
        anios = serializers.serialize('json', resultado)
    return HttpResponse(json.dumps(anios),
            content_type="application/json");


def login_view(request):

    mensaje = ''
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect("/importaciones/informacion/")
            else:
                mensaje = "Su cuenta no esta activa, contacte al administrador"
        mensaje = 'Nombre de usuario o contrasena no valido'
    return render(request, 'importaciones/login.html', {'mensaje': mensaje})


@login_required
def logoutUsuario(request):
    logout(request)
    return HttpResponseRedirect("/importaciones/logout/")
