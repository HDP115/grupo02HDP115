from django.shortcuts import render
from django.http import HttpResponse
import json
from importaciones.models import *
from django.core import serializers
from django.core.serializers.json import DjangoJSONEncoder

# Create your views here.
def plantilla(request):
    return render(request,'importaciones/plantilla.html')

def info(request):
    return render(request, 'importaciones/informacion.html')

def agregarDatos(request):
    return render(request, 'importaciones/agregarDatos.html')

def consultar(request):
    return render(request, 'importaciones/consultar.html')

def formulas(request):
    return render(request, 'importaciones/formulas.html')

def agregarIndi(request):
    return render(request, 'importaciones/agregarIndividual.html')

def graficar(request):
    data = request.POST.get('table')
    Context = {'tabla' : data}

    return render(request, 'importaciones/graficar.html', Context)

def habilitarConsulta(request):
    if request.is_ajax() or request.method == 'POST':
        tipo = request.POST.get('tipo')
        if(tipo == '1'):
            consulta = Periodoanual.objects.all()
        if(tipo == '2'):
            consulta = Producto.objects.all().order_by('-codigo_producto')
        resultado = serializers.serialize('json', consulta)
    else:
        resultado = "";

    return HttpResponse(json.dumps(resultado), content_type="application/json");

def buscar(request):
    if request.is_ajax() or request.method == 'POST':
        tipo = request.POST.get('tipo')
        anio = request.POST.get('anio')
        prod = request.POST.get('producto')
        numAnio = int(anio);

        if tipo == '1':
            if prod != '0':
                consulta = Dato.objects.filter(periodomensual__anio = numAnio, codigo_producto__nombre_producto = prod).values("periodomensual__mes", "importacion", "exportacion")
            else:
                consulta = Dato.objects.filter(periodomensual__anio = numAnio).values("codigo_producto__nombre_producto", "periodomensual__mes", "importacion", "exportacion").order_by("periodomensual", "codigo_producto").exclude(codigo_producto=0)
        if tipo == '2':
            consulta = Productointernobruto.objects.filter(periodotrimestral__anio = numAnio).values("tipo", "periodotrimestral__trimestre", "cantidad").order_by("periodotrimestral__trimestre","tipo");

        #resultado = serializers.serialize('json', consulta)

    return HttpResponse(json.dumps(list(consulta),cls=DjangoJSONEncoder), content_type="application/json");
