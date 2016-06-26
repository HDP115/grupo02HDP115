from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.login_view, name='login'),
    url(r'^logout/$', views.logoutUsuario, name="logout"),
    url(r'^informacion/$', views.info, name='informacion'),
    url(r'agregarDatos', views.agregarDatos, name='agregarDatos'),
    url(r'consultar', views.consultar, name='consultar'),
    url(r'formulas', views.formulas, name='formulas'),
    url(r'agregarIndividual', views.agregarIndi, name='agregarIndividual'),
    url(r'graficar', views.graficar, name='graficar'),
    url(r'plantilla', views.plantilla, name='plantilla'),
    url(r'habilitarConsulta', views.habilitarConsulta, name='habilitarConsulta'),
    url(r'buscar', views.buscar, name='buscar'),
    url(r'guardar', views.guardar, name='guardar'),     
    url(r'habilitarMeses', views.habilitarMeses, name='habilitarMeses'),
    url(r'informacion', views.info, name='info'),
]
