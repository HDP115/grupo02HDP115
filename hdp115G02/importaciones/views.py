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
from django.core.serializers.json import DjangoJSONEncoder

# Create your views here.
def plantilla(request):
    return render(request,'importaciones/plantilla.html')

@login_required(login_url='/importaciones/')
def info(request):
    return render(request, 'importaciones/informacion.html')

@login_required(login_url='/importaciones/')
def agregarDatos(request):
    return render(request, 'importaciones/agregarDatos.html')

@login_required(login_url='/importaciones/')
def consultar(request):
    return render(request, 'importaciones/consultar.html')

@login_required(login_url='/importaciones/')
def formulas(request):
    return render(request, 'importaciones/formulas.html')

@login_required(login_url='/importaciones/')
def agregarIndi(request):
    #obtiene la lista de productos y anios.
    productos= Producto.objects.all()
    anios = Periodoanual.objects.all()
    return render(request, 'importaciones/agregarIndividual.html', {'productos': productos, 'anios': anios})

@login_required(login_url='/importaciones/')
def graficar(request):
    #copia la tabla de la pagina origen hacia graficar.html
    data = request.POST.get('table')
    Context = {'tabla' : data}

    return render(request, 'importaciones/graficar.html', Context)


def habilitarConsulta(request):
    if request.is_ajax() or request.method == 'POST':
        tipo = request.POST.get('tipo')
        #Devuelve la lista de anios o la lista de productos.
        if(tipo == '1'):
            consulta = Periodoanual.objects.all()
        if(tipo == '2'):
            consulta = Producto.objects.all().order_by('-codigo_producto') #Consulta ordenada descendente.
        resultado = serializers.serialize('json', consulta)
    else:
        resultado = "";

    return HttpResponse(json.dumps(resultado), content_type="application/json");

def habilitarMeses(request):
    if request.is_ajax() or request.method == 'POST':
        anio = request.POST.get('anio')
        numAnio = int(anio);
        consulta = Periodomensual.objects.filter(anio = numAnio).values("mes").order_by("id")

    return HttpResponse(json.dumps(list(consulta),cls=DjangoJSONEncoder), content_type="application/json");

def guardar(request):
    if request.is_ajax() or request.method == 'POST':
        anio = int(request.POST.get('anio'))
        mes = request.POST.get('mes')
        p = int(request.POST.get('producto'))
        val = float(request.POST.get('val'))
        #Recupera el objeto Dato que se desea modificar.
        dato = Dato.objects.filter(codigo_producto = p, periodomensual__mes = mes, periodomensual__anio = anio)
        d = dato[0]
        #Modifica y salva el objeto.
        d.importacion = val
        d.save()

    resultado = serializers.serialize('json', dato)
    return HttpResponse(json.dumps(resultado), content_type="application/json");

@login_required(login_url='/importaciones/')
def buscar(request):
    if request.is_ajax() or request.method == 'POST':
        tipo = request.POST.get('tipo')
        anio = request.POST.get('anio')
        prod = request.POST.get('producto')
        numAnio = int(anio);

        #recupera los datos solicitados.
        if tipo == '1':
            if prod != '0':
                consulta = Dato.objects.filter(periodomensual__anio = numAnio, codigo_producto__nombre_producto = prod).values("periodomensual__mes", "importacion", "exportacion").order_by("periodomensual")
            else:
                consulta = Dato.objects.filter(periodomensual__anio = numAnio).values("codigo_producto__nombre_producto", "periodomensual__mes", "importacion", "exportacion").order_by("periodomensual", "codigo_producto").exclude(codigo_producto=0)
        if tipo == '2':
            consulta = Productointernobruto.objects.filter(periodotrimestral__anio = numAnio).values("tipo", "periodotrimestral__trimestre", "cantidad").order_by("periodotrimestral__trimestre","tipo");

    #la funcion list convierte un querySet en una list que se puede onvertir a formato JSON.
    return HttpResponse(json.dumps(list(consulta),cls=DjangoJSONEncoder), content_type="application/json");


def login_view(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect("/importaciones/informacion/")

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
    return HttpResponseRedirect("/importaciones/")
