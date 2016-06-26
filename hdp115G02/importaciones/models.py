# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Dato(models.Model):
    codigo_producto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='codigo_producto')
    periodomensual = models.ForeignKey('Periodomensual', models.DO_NOTHING)
    importacion = models.DecimalField(max_digits=12, decimal_places=2)
    exportacion = models.DecimalField(max_digits=12, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'dato'
        unique_together = (('periodomensual', 'codigo_producto'),)

    def __str__(self):
        return '%s en %s' % (self.codigo_producto, self.periodomensual)


class Periodoanual(models.Model):
    anio = models.SmallIntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'periodoanual'

    def __str__(self):
        return '%i' % (self.anio)

    def as_json(self):
        return dict(anio = self.anio)


class Periodomensual(models.Model):
    mes = models.CharField(max_length=15)
    anio = models.ForeignKey(Periodoanual, models.DO_NOTHING, db_column='anio')

    class Meta:
        managed = False
        db_table = 'periodomensual'
        unique_together = (('mes', 'anio'),)

    def __str__(self):
        return '%s de %s' % (self.mes, self.anio)

    def as_json(self):
        return dict(mes = self.mes, anio = self.anio.anio)


class Periodotrimestral(models.Model):
    trimestre = models.CharField(max_length=3)
    anio = models.ForeignKey(Periodoanual, models.DO_NOTHING, db_column='anio')

    class Meta:
        managed = False
        db_table = 'periodotrimestral'

    def __str__(self):
        return '%s de %s' % (self.trimestre, self.anio)


class Producto(models.Model):
    codigo_producto = models.IntegerField(primary_key=True)
    nombre_producto = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'producto'

    def __str__(self):
        return self.nombre_producto


class Productointernobruto(models.Model):
    periodotrimestral = models.ForeignKey(Periodotrimestral, models.DO_NOTHING)
    cantidad = models.DecimalField(max_digits=8, decimal_places=2)
    tipo = models.CharField(max_length=9)

    class Meta:
        managed = False
        db_table = 'productointernobruto'
        unique_together = (('periodotrimestral', 'tipo'),)

    def __str__(self):
        return 'PIB en %s' % (self.periodotrimestral)
