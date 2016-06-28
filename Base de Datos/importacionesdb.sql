/* eliminar las tablas anteriores, si es que existen */

drop index valido_para_fk;
drop index describe_fk;
drop index dato_pk;
drop table dato;
drop index pertenece_fk;
drop index pertenece3_fk;
drop index productointernobruto_pk;
drop table productointernobruto;
drop index periodomensual_pk;
drop table periodomensual;
drop index pertenece2_fk;
drop index periodotrimestral_pk;
drop table periodotrimestral;
drop index periodoanual_pk;
drop table periodoanual;
drop index producto_pk;
drop table producto;


/* table: dato */
create table dato (
   id			serial		     not null,
   codigo_producto      integer              not null,
   periodomensual_id	integer		     not null,
   importacion          decimal(12,2)         not null,
   exportacion          decimal(12,2)         not null,
   constraint pk_dato primary key (id),
   /* solo se permite un dato para la misma combinación de periodo y producto */
   constraint dato_unique unique (periodomensual_id, codigo_producto),
   /* check para evitar datos negativos */
   constraint imp_pos check (importacion >= 0),
   constraint exp_pos check (exportacion >= 0)
);

/* index: dato_pk */
create unique index dato_pk on dato (
id
);

/* index: describe_fk */
create  index describe_fk on dato (
codigo_producto
);

/* index: valido_para_fk */
create  index valido_para_fk on dato (
periodomensual_id
);


/* table: periodoanual */
create table periodoanual (
   anio                 smallint             not null,
   constraint pk_periodoanual primary key (anio)
);

/* index: periodoanual_pk */
create unique index periodoanual_pk on periodoanual (
anio
);


/* table: periodomensual */
create table periodomensual (
   id			serial 		     not null,
   mes                  varchar(15)          not null,
   anio                 smallint             not null,
   constraint pk_periodomensual primary key (id),
   /* Los meses no se puede repetir en el mismo año */
   constraint mes_unique unique (mes, anio),
   /* Los meses deben ser escritos iniciando en mayuscula */
   constraint meses check (mes in ('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'))
);

/* index: periodomensual_pk */
create unique index periodomensual_pk on periodomensual (
id
);

/* index: pertenece_fk */
create  index pertenece_fk on periodomensual (
anio	);


/* table: periodotrimestral */
create table periodotrimestral (
   id			serial		     not null,
   trimestre            varchar(3)           not null,
   anio                 smallint             not null,
   constraint pk_periodotrimestral primary key (id),
   /* los trimestres no se deben repetir en el mismo año */
   constraint trimestre_unique unique (trimestre, anio),
   /* Los trimestres se numeran con romanos en matuscula */
   constraint trimestres check (trimestre in ('I', 'II', 'III', 'IV'))
);

/* index: periodotrimestral_pk */
create unique index periodotrimestral_pk on periodotrimestral (
id
);

/* index: pertenece2_fk */
create  index pertenece2_fk on periodotrimestral (
anio
);



/* table: producto */
create table producto (
   codigo_producto      integer              not null,
   nombre_producto      varchar(100)         not null,
   constraint pk_producto primary key (codigo_producto)
);


/* index: producto_pk */
create unique index producto_pk on producto (
codigo_producto
);


/* table: productointernobruto */
create table productointernobruto (
   id 			serial		     not null,
   periodotrimestral_id	integer		     not null,
   cantidad             decimal(8,2)         not null,
   tipo			varchar(9)	     not null,
   constraint pk_productointernobruto primary key (id),
   /* solo puede existir un pib para la misma combinación de trimestre y tipo de pib */
   constraint pib_unique unique (periodotrimestral_id, tipo),
   /* el tipo del pib debe ser de los tipos aqui listados */
   constraint tipos check (tipo in ('Corriente', 'Constante')),
   /* la cantidad (valor del pib) debe ser positivo */
   constraint cantidad_pos check (cantidad >= 0) 
);

/* index: productointernobruto_pk*/
create unique index productointernobruto_pk on productointernobruto (
id
);

/* index: pertenece3_fk*/
create  index pertenece3_fk on productointernobruto (
periodotrimestral_id
);


/* asignación de llaves foraneas */
alter table dato
   add constraint fk_dato_describe_producto foreign key (codigo_producto)
      references producto (codigo_producto) on delete restrict on update restrict;

alter table dato
   add constraint fk_dato_valido_pa_periodom foreign key (periodomensual_id)
      references periodomensual (id) on delete restrict on update restrict;

alter table periodomensual
   add constraint fk_periodom_pertenece_periodoa foreign key (anio)
      references periodoanual (anio) on delete restrict on update restrict;

alter table periodotrimestral
   add constraint fk_periodot_pertenece_periodoa foreign key (anio)
      references periodoanual (anio) on delete restrict on update restrict;

alter table productointernobruto
   add constraint fk_producto_valido_pa_periodot foreign key (periodotrimestral_id)
      references periodotrimestral (id) on delete restrict on update restrict;
