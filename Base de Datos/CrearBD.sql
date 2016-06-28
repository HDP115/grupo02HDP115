/*Eliminar las tablas anteriores, si es que existen*/

drop index VALIDO_PARA_FK;
drop index DESCRIBE_FK;
drop index DATO_PK;
drop table DATO;
drop index PERTENECE_FK;
drop index PRODUCTOINTERNOBRUTO_PK;
drop table PRODUCTOINTERNOBRUTO;
drop index PERIODOMENSUAL_PK;
drop table PERIODOMENSUAL;
drop index PERTENECE2_FK;
drop index PERIODOTRIMESTRAL_PK;
drop table PERIODOTRIMESTRAL;
drop index PERIODOANUAL_PK;
drop table PERIODOANUAL;
drop index PRODUCTO_PK;
drop table PRODUCTO;


/* Table: DATO*/
create table DATO (
   ID			SERIAL		     not null,
   CODIGO_PRODUCTO      INTEGER              not null,
   PERIODOMENSUAL_ID	INTEGER		     not null,
   IMPORTACION          DECIMAL(12,2)         not null,
   EXPORTACION          DECIMAL(12,2)         not null,
   constraint PK_DATO primary key (ID),
   CONSTRAINT dato_unique UNIQUE (periodomensual_id, codigo_producto),
   constraint imp_pos check (importacion >= 0),
   constraint exp_pos check (exportacion >= 0)
);

/* Index: DATO_PK*/
create unique index DATO_PK on DATO (
ID
);

/* Index: DESCRIBE_FK*/
create  index DESCRIBE_FK on DATO (
CODIGO_PRODUCTO
);

/* Index: VALIDO_PARA_FK*/
create  index VALIDO_PARA_FK on DATO (
PERIODOMENSUAL_ID
);

/* Table: PERIODOANUAL*/
create table PERIODOANUAL (
   ANIO                 SMALLINT             not null,
   constraint PK_PERIODOANUAL primary key (ANIO)
);

/* Index: PERIODOANUAL_PK*/
create unique index PERIODOANUAL_PK on PERIODOANUAL (
ANIO
);

/* Table: PERIODOMENSUAL*/
create table PERIODOMENSUAL (
   ID			SERIAL 		     not null,
   MES                  VARCHAR(15)          not null,
   ANIO                 SMALLINT             not null,
   constraint PK_PERIODOMENSUAL primary key (ID),
   constraint mes_unique UNIQUE (mes, anio),
   constraint meses CHECK (mes in ('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'))
);

/* Index: PERIODOMENSUAL_PK*/
create unique index PERIODOMENSUAL_PK on PERIODOMENSUAL (
ID
);

/* Index: PERTENECE_FK*/
create  index PERTENECE_FK on PERIODOMENSUAL (
ANIO	);

/* Table: PERIODOTRIMESTRAL*/
create table PERIODOTRIMESTRAL (
   ID			SERIAL		     not null,
   TRIMESTRE            VARCHAR(3)           not null,
   ANIO                 SMALLINT             not null,
   constraint PK_PERIODOTRIMESTRAL primary key (ID),
   constraint trimestre_unique UNIQUE (trimestre, anio),
   constraint trimestres CHECK (trimestre in ('I', 'II', 'III', 'IV'))
);

/* Index: PERIODOTRIMESTRAL_PK*/
create unique index PERIODOTRIMESTRAL_PK on PERIODOTRIMESTRAL (
ID
);

/* Index: PERTENECE2_FK*/
create  index PERTENECE2_FK on PERIODOTRIMESTRAL (
ANIO
);


/* Table: PRODUCTO*/
create table PRODUCTO (
   CODIGO_PRODUCTO      INTEGER              not null,
   NOMBRE_PRODUCTO      VARCHAR(100)         not null,
   constraint PK_PRODUCTO primary key (CODIGO_PRODUCTO)
);


/* Index: PRODUCTO_PK*/
create unique index PRODUCTO_PK on PRODUCTO (
CODIGO_PRODUCTO
);

/* Table: PRODUCTOINTERNOBRUTO*/
create table PRODUCTOINTERNOBRUTO (
   ID 			serial		     not null,
   PERIODOTRIMESTRAL_ID	INTEGER		     not null,
   CANTIDAD             DECIMAL(8,2)         not null,
   TIPO			varchar(9)	     not null,
   constraint PK_PRODUCTOINTERNOBRUTO primary key (ID),
   constraint pib_unique UNIQUE (PERIODOTRIMESTRAL_ID, TIPO),
   constraint tipos CHECK (tipo in ('Corriente', 'Constante')),
   constraint cantidad_pos CHECK (cantidad >= 0) 
);

/* Index: PRODUCTOINTERNOBRUTO_PK*/
create unique index PRODUCTOINTERNOBRUTO_PK on PRODUCTOINTERNOBRUTO (
ID
);

/* Index: PERTENECE3_FK*/
create  index PERTENECE3_FK on PRODUCTOINTERNOBRUTO (
PERIODOTRIMESTRAL_ID
);

alter table DATO
   add constraint FK_DATO_DESCRIBE_PRODUCTO foreign key (CODIGO_PRODUCTO)
      references PRODUCTO (CODIGO_PRODUCTO) on delete restrict on update restrict;

alter table DATO
   add constraint FK_DATO_VALIDO_PA_PERIODOM foreign key (PERIODOMENSUAL_ID)
      references PERIODOMENSUAL (ID) on delete restrict on update restrict;

alter table PERIODOMENSUAL
   add constraint FK_PERIODOM_PERTENECE_PERIODOA foreign key (ANIO)
      references PERIODOANUAL (ANIO) on delete restrict on update restrict;

alter table PERIODOTRIMESTRAL
   add constraint FK_PERIODOT_PERTENECE_PERIODOA foreign key (ANIO)
      references PERIODOANUAL (ANIO) on delete restrict on update restrict;

alter table PRODUCTOINTERNOBRUTO
   add constraint FK_PRODUCTO_VALIDO_PA_PERIODOT foreign key (PERIODOTRIMESTRAL_ID)
      references PERIODOTRIMESTRAL (ID) on delete restrict on update restrict;
