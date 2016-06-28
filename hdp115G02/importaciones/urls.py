from django.conf.urls import url

from . import views

urlpatterns = [
    # log in y log out
    url(r'^$', views.login_view, name='login'),
    url(r'^logout/$', views.logoutUsuario, name="logout"),
    #pantalla inicial
    url(r'^informacion/$', views.info, name='informacion'),
    # vistas del sitio
    url(r'agregarDatos', views.agregarDatos, name='agregarDatos'),
    url(r'consultar', views.consultar, name='consultar'),
    url(r'formulas', views.formulas, name='formulas'),
    url(r'agregarIndividual', views.agregarIndi, name='agregarIndividual'),
    url(r'graficar', views.graficar, name='graficar'),
    # URL para el uso de AJAX
    url(r'habilitarConsulta', views.habilitarConsulta, name='habilitarConsulta'),
    url(r'buscar', views.buscar, name='buscar'),
    url(r'guardar', views.guardar, name='guardar'),
    url(r'habilitarMeses', views.habilitarMeses, name='habilitarMeses'),
    # para acceder a la informacion desde cualquier otra vista
    url(r'informacion', views.info, name='info'),
]
