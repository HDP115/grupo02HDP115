/* Periodos anuales */
INSERT INTO periodoanual VALUES(2014);
INSERT INTO periodoanual VALUES(2015);

/* Periodos mensuales. */
INSERT INTO periodomensual(mes, anio) VALUES ('Enero', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Febrero', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Marzo', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Abril', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Mayo', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Junio', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Julio', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Agosto', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Septiembre', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Octubre', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Noviembre', 2014);
INSERT INTO periodomensual(mes, anio) VALUES ('Diciembre', 2014);


INSERT INTO periodomensual(mes, anio) VALUES ('Enero', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Febrero', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Marzo', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Abril', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Mayo', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Junio', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Julio', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Agosto', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Septiembre', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Octubre', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Noviembre', 2015);
INSERT INTO periodomensual(mes, anio) VALUES ('Diciembre', 2015);


/* Periodos trimestrales */
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('I', 2014);
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('II', 2014);
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('III', 2014);
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('IV', 2014);

INSERT INTO periodotrimestral(trimestre, anio) VALUES ('I', 2015);
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('II', 2015);
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('III', 2015);
INSERT INTO periodotrimestral(trimestre, anio) VALUES ('IV', 2015);


/* PIB */
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'I' AND anio = 2014), 6212.1, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'I' AND anio = 2014), 2443.9, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'II' AND anio = 2014), 6203.5, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'II' AND anio = 2014), 2431.0, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'III' AND anio = 2014), 6277.6, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'III' AND anio = 2014), 2424.7, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'IV' AND anio = 2014), 6361.0, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'IV' AND anio = 2014), 2463.9, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'I' AND anio = 2015), 6388.7, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'I' AND anio = 2015), 2496.8, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'II' AND anio = 2015), 6387.9, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'II' AND anio = 2015), 2487.9, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'III' AND anio = 2015), 6496.6, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'III' AND anio = 2015), 2490.0, 'Constante');

INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'IV' AND anio = 2015), 6577.1, 'Corriente');
INSERT INTO productointernobruto(periodotrimestral_id, cantidad, tipo) VALUES ((SELECT id FROM periodotrimestral WHERE trimestre = 'IV' AND anio = 2015), 2528.5, 'Constante');

/* Productos */
INSERT INTO producto(codigo_producto, nombre_producto) VALUES (27101921, 'Gasolina diesel');
INSERT INTO producto(codigo_producto, nombre_producto) VALUES (27101230, 'Otras gasolinas');
INSERT INTO producto(codigo_producto, nombre_producto) VALUES (27101922, 'Gasolina fuel N. 6');
INSERT INTO producto(codigo_producto, nombre_producto) VALUES (30049091, 'Medicina para uso humano');
INSERT INTO producto(codigo_producto, nombre_producto) VALUES (85171200, 'Teléfonos móviles');
INSERT INTO producto(codigo_producto, nombre_producto) VALUES (0, 'Total');

/* Datos */
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2014), 67075722.93, 2);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2014), 40525750.66, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2014), 50698737.25, 140675.88);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2014), 50403988.24, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2014), 58248217.73, 89074.65);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2014), 33351078.07, 541243.03);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2014), 48764388.26, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2014), 31719740.95, 607500);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2014), 28428030.53, 176817);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2014), 40645260.48, 112212);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2014), 33299219.99, 1140366.04);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2014), 26972769.17, 269686.5);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2014), 50207473.31, 6);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2014), 28273201.37, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2014), 33641956.07, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2014), 39346027.65, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2014), 42792757.06, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2014), 39242366.49, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2014), 35522826.78, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2014), 39713298.22, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2014), 43432929.59, 3);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2014), 29697184.18, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2014), 30216500.06, 10);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2014), 31081351.89, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2014), 27575680.03, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2014), 16154624.59, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2014), 41742082.03, 15);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2014), 25202384.6, 2);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2014), 9907330.53, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2014), 29297043.94, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2014), 46713475.46, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2014), 0, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2014), 28190950.01, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2014), 34447732.96, 95264.98);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2014), 33845096.52, 175578.9);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2014), 19656319.69, 649051.9);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2014), 12749682.05, 4536387.43);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2014), 15323075.32, 4398621.44);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2014), 16236745.11, 5668206.05);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2014), 18448768.97, 4988296.21);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2014), 19710264.93, 5673366.42);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2014), 16958141.12, 5811643.76);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2014), 21663722.55, 7141569.25);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2014), 14592908.68, 5506235.14);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2014), 14210525.61, 6126670.08);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2014), 18701918, 5146105.75);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2014), 15685890.43, 5810363.03);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2014), 16594651.32, 4127294);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2014), 18269146.81, 165411.12);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2014), 13894617.63, 429783.45);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2014), 15708969.78, 21625.91);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2014), 23886109.08, 31931.98);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2014), 20815684.12, 72152.22);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2014), 13165437.29, 566383.13);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2014), 9591212, 298960.51);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2014), 6426881.41, 1064410.9);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2014), 8258805.43, 217400.24);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2014), 15649206.56, 1316025.61);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2014), 18670062.18, 416459.74);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2014), 14692578.18, 142954.82);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2014), 850325134.46, 324894554.47);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2014), 756673814.1, 337318456.65);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2014), 835689979.71, 388218601.98);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2014), 834863577.42, 336813144.12);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2014), 901712418.86, 390223919.82);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2014), 815404611.76, 372628041.07);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2014), 865031915.43, 378978465.64);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2014), 730909767.72, 357544653.12);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2014), 778166087, 341885066.12);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2014), 853565534.42, 348674193.11);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2014), 824258280.76, 345786777.03);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2014), 787990375.73, 325720331.52);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2015), 45604031.53, 348697.2);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2015), 38715310.29, 289159.4);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2015), 24832578.84, 1123447.6);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2015), 43486677.54, 237228);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2015), 44367088.46, 80352);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2015), 34232507.72, 529891);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2015), 46717029.16, 156141.45);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2015), 30496269, 192225);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2015), 23821422.38, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2015), 21717970.84, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2015), 28906662.38, 337074.99);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101921, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2015), 17487074.27, 170619.88);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2015), 24068702.29, 247509.91);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2015), 35659013.92, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2015), 24182642.42, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2015), 33097817.76, 33.75);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2015), 53012233.86, 32656.42);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2015), 31954998.53, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2015), 43450561.53, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2015), 31367852.62, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2015), 31832265.67, 25);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2015), 24855271.07, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2015), 21413529.03, 26.6);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101230, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2015), 27519822.07, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2015), 25444918.33, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2015), 59440619.9, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2015), 8795071.72, 57439.06);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2015), 12015925.87, 302195.12);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2015), 9346641.26, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2015), 28057637.56, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2015), 15891352.52, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2015), 10966482.81, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2015), 21132129.34, 40668.23);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2015), 35972971.61, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2015), 18905500.2, 0);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (27101922, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2015), 1863418.08, 22691.34);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2015), 13097406.39, 6029876.31);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2015), 15410007.46, 5963777.12);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2015), 20346321.14, 5954174.71);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2015), 28170011.74, 5007267.37);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2015), 27609206.77, 6763565.9);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2015), 24477162.26, 6314330.62);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2015), 18155807.96, 8497810.3);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2015), 15592435.8, 5520776.43);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2015), 21065106.68, 7770231.51);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2015), 16242856.59, 6019234.32);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2015), 18162772.27, 7626856.57);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (30049091, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2015), 17388468.98, 4391802.31);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2015), 13377661.02, 463385.47);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2015), 14500791.27, 173993.82);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2015), 17331046.72, 31196.76);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2015), 16446210.73, 418763.5);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2015), 11409880.86, 254926.32);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2015), 11261216.61, 499875.75);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2015), 15571296.97, 94522.62);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2015), 11994751.4, 54922.03);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2015), 13955002.1, 144793.83);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2015), 23757241.39, 366526.26);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2015), 15998099.17, 202782.17);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (85171200, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2015), 15659551.09, 1104481.33);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Enero' AND anio =2015), 790554922.69, 344932024.33);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Febrero' AND anio =2015), 786981997.46, 388848170.85);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Marzo' AND anio =2015), 808083476.97, 434594704.7);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Abril' AND anio =2015), 802143872.68, 344269747.44);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Mayo' AND anio =2015), 846831489.03, 393851985.72);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Junio' AND anio =2015), 841279074.99, 370468466.71);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Julio' AND anio =2015), 894774357.77, 422374750.66);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Agosto' AND anio =2015), 776752549.53, 331234881.24);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Septiembre' AND anio =2015), 831526064.83, 348728024.38);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Octubre' AND anio =2015), 784092620.22, 368609229.86);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Noviembre' AND anio =2015), 805039180.86, 325344249.2);
INSERT INTO dato(codigo_producto, periodomensual_id, importacion, exportacion) VALUES (0, (SELECT id FROM periodomensual WHERE mes = 'Diciembre' AND anio =2015), 772739391.34, 299348256.74);