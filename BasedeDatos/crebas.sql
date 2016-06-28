/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     30/5/2016 8:43:17 p. m.                      */
/*==============================================================*/


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

drop index USUARIO_PK;

drop table USUARIO;

/*==============================================================*/
/* Table: DATO                                                  */
/*==============================================================*/
create table DATO (
   CODIGO_PRODUCTO      INTEGER              not null,
   MES                  VARCHAR(15)          not null,
   ANIO                 SMALLINT             not null,
   IMPORTACION          DECIMAL(8,2)         not null,
   EXPORTACION          DECIMAL(8,2)         not null,
   constraint PK_DATO primary key (CODIGO_PRODUCTO, MES, ANIO)
);

/*==============================================================*/
/* Index: DATO_PK                                               */
/*==============================================================*/
create unique index DATO_PK on DATO (
CODIGO_PRODUCTO,
MES,
ANIO
);

/*==============================================================*/
/* Index: DESCRIBE_FK                                           */
/*==============================================================*/
create  index DESCRIBE_FK on DATO (
CODIGO_PRODUCTO
);

/*==============================================================*/
/* Index: VALIDO_PARA_FK                                        */
/*==============================================================*/
create  index VALIDO_PARA_FK on DATO (
MES,
ANIO
);

/*==============================================================*/
/* Table: PERIODOANUAL                                          */
/*==============================================================*/
create table PERIODOANUAL (
   ANIO                 SMALLINT             not null,
   constraint PK_PERIODOANUAL primary key (ANIO)
);

/*==============================================================*/
/* Index: PERIODOANUAL_PK                                       */
/*==============================================================*/
create unique index PERIODOANUAL_PK on PERIODOANUAL (
ANIO
);

/*==============================================================*/
/* Table: PERIODOMENSUAL                                        */
/*==============================================================*/
create table PERIODOMENSUAL (
   MES                  VARCHAR(15)          not null,
   ANIO                 SMALLINT             not null,
   constraint PK_PERIODOMENSUAL primary key (MES, ANIO)
);

/*==============================================================*/
/* Index: PERIODOMENSUAL_PK                                     */
/*==============================================================*/
create unique index PERIODOMENSUAL_PK on PERIODOMENSUAL (
MES,
ANIO
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create  index PERTENECE_FK on PERIODOMENSUAL (
ANIO
);

/*==============================================================*/
/* Table: PERIODOTRIMESTRAL                                     */
/*==============================================================*/
create table PERIODOTRIMESTRAL (
   TRIMESTRE            VARCHAR(3)           not null,
   ANIO                 SMALLINT             not null,
   constraint PK_PERIODOTRIMESTRAL primary key (TRIMESTRE, ANIO)
);

/*==============================================================*/
/* Index: PERIODOTRIMESTRAL_PK                                  */
/*==============================================================*/
create unique index PERIODOTRIMESTRAL_PK on PERIODOTRIMESTRAL (
TRIMESTRE,
ANIO
);

/*==============================================================*/
/* Index: PERTENECE2_FK                                         */
/*==============================================================*/
create  index PERTENECE2_FK on PERIODOTRIMESTRAL (
ANIO
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   CODIGO_PRODUCTO      INTEGER              not null,
   NOMBRE_PRODUCTO      VARCHAR(100)         not null,
   constraint PK_PRODUCTO primary key (CODIGO_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
CODIGO_PRODUCTO
);

/*==============================================================*/
/* Table: PRODUCTOINTERNOBRUTO                                  */
/*==============================================================*/
create table PRODUCTOINTERNOBRUTO (
   TRIMESTRE            VARCHAR(3)           not null,
   ANIO                 SMALLINT             not null,
   CANTIDAD             DECIMAL(8,2)         not null,
   constraint PK_PRODUCTOINTERNOBRUTO primary key (TRIMESTRE, ANIO)
);

/*==============================================================*/
/* Index: PRODUCTOINTERNOBRUTO_PK                               */
/*==============================================================*/
create unique index PRODUCTOINTERNOBRUTO_PK on PRODUCTOINTERNOBRUTO (
TRIMESTRE,
ANIO
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID                   VARCHAR(50)          not null,
   NOMBRE               VARCHAR(50)          not null,
   PASSWORD             VARCHAR(50)          not null,
   constraint PK_USUARIO primary key (ID)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
ID
);

alter table DATO
   add constraint FK_DATO_DESCRIBE_PRODUCTO foreign key (CODIGO_PRODUCTO)
      references PRODUCTO (CODIGO_PRODUCTO)
      on delete restrict on update restrict;

alter table DATO
   add constraint FK_DATO_VALIDO_PA_PERIODOM foreign key (MES, ANIO)
      references PERIODOMENSUAL (MES, ANIO)
      on delete restrict on update restrict;

alter table PERIODOMENSUAL
   add constraint FK_PERIODOM_PERTENECE_PERIODOA foreign key (ANIO)
      references PERIODOANUAL (ANIO)
      on delete restrict on update restrict;

alter table PERIODOTRIMESTRAL
   add constraint FK_PERIODOT_PERTENECE_PERIODOA foreign key (ANIO)
      references PERIODOANUAL (ANIO)
      on delete restrict on update restrict;

alter table PRODUCTOINTERNOBRUTO
   add constraint FK_PRODUCTO_VALIDO_PA_PERIODOT foreign key (TRIMESTRE, ANIO)
      references PERIODOTRIMESTRAL (TRIMESTRE, ANIO)
      on delete restrict on update restrict;

