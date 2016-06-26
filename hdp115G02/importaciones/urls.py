from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.info, name='info'),
    url(r'info', views.info, name='info'),
    url(r'agregarDatos', views.agregarDatos, name='agregarDatos'),
    url(r'consultar', views.consultar, name='consultar'),
    url(r'formulas', views.formulas, name='formulas'),
    url(r'agregarIndividual', views.agregarIndi, name='agregarIndividual'),
    url(r'graficar', views.graficar, name='graficar'),
    url(r'plantilla', views.plantilla, name='plantilla'),
    url(r'habilitarConsulta', views.habilitarConsulta, name='habilitarConsulta'),
    url(r'buscar', views.buscar, name='buscar'),
]
