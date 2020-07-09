-- inserciones en tablas
Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (220,'Juan','Fernandez', 'Rivadavia 5300', '1424',NULL, 4500.00, '2017-05-23', '2000-03-05', 231451, NULL);

-- UPDATE bases_datos.empleado set Fecha_Ingreso = '2017-05-23' where Cod_Empleado = 220;
-- UPDATE bases_datos.empleado set Fecha_Ingreso = '2000-03-05' where Cod_Empleado = 220;

Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (210,'Enrique','Gomez', 'Solis 200', '5421',NULL, 5000.00, '2017-05-03', '1999-04-15', 231451, 220);

Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (250,'Juan','Perez', 'Angel Gallardo 320', '1474',NULL, 6000.00, '2013-05-12', '1995-01-09', 52231451, 210);

Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (100,'Benito','Perez', '25 de Mayo 300', '1124',NULL, 7000.00, '2011-09-03', '1990-08-12', 231451, NULL);

Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (260,'Maria','Del Carmen', 'Virrey Liniers 3000', '1244',NULL, 2500.00, '2019-05-23', '2001-03-05', 2451345, 100);

Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (270,'Gimena','Acardi', 'Virrey Liniers 380', '1242',NULL, 2000.00, '2020-10-23', '2001-03-15', 44851345, 210);
-- ----------------------------------------------------------------------------
SELECT * FROM bases_datos.cliente;

Insert into bases_datos.cliente(Cod_Cliente, Razon_Social, Direccion) values (210, 'Finanzas', 'Veracruz 200');
Insert into bases_datos.cliente(Cod_Cliente, Razon_Social, Direccion) values (230, 'Muebles', 'Veracruz 250');
Insert into bases_datos.cliente(Cod_Cliente, Razon_Social, Direccion) values (250, 'Mercaderia Almacen', 'Luis Enrique 100');
Insert into bases_datos.cliente(Cod_Cliente, Razon_Social, Direccion) values (240, 'Almacen', 'Luis Enrique 300');

-- ----------------------------------------------------------------------------
SELECT * FROM bases_datos.deposito;

Insert into bases_datos.deposito(Cod_deposito, Ubicacion_deposito) values (400, 'Diaz Velez 20');
Insert into bases_datos.deposito(Cod_deposito, Ubicacion_deposito) values (440, 'Ribera Indarte 201');


-- -----------------------------------------------------------------------
Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (300, 210, 220,'2019-07-06', '2019-07-08',440);
Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (320, 230, 210,'2019-09-16', '2019-09-18',440);

Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (350, 210, 220,'2020-06-06', '2020-06-08',440);
Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (360, 230, 210,'2020-08-06', '2020-08-08',440);
Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (370, 210, 210,'2020-06-08', '2020-06-10',440);
Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (380, 210, 210,'2020-06-09', '2020-06-10',440);

update bases_datos.pedido set Cod_Cliente = NULL where Nro_pedido = 380;
update bases_datos.pedido set Cod_Cliente = NULL where Nro_pedido = 360;

SELECT * FROM bases_datos.articulo;
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (200,'Balde de limpieza', 'A',500.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (20,'CIF', 'A',100.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (2,'ojotas', 'B',170.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (4,'Lentes de sol', 'B',2000.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (8,'Alpargatas', 'C',370.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (10,'Protector Bucal', 'C',400.00);

Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (17,'Televisor 50"', 'C',20000.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (16,'Celular 50"', 'C',40000.00);
update bases_datos.articulo set Descripcion = 'Celular' where Cod_Articulo = '16';
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (19,'Lavarropas', 'C',30000.00);

SELECT * FROM bases_datos.detalle_pedido;
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (300, 20, 1);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (320, 200, 4);

Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (300, 2, 1);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (320, 4, 2);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (320, 8, 3);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (300, 10, 2);

Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (350, 200, 2);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (370, 20, 4);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (380, 16, 1);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (370, 16, 1);

-- ---------------------------------------------------------------------------------------

Insert into bases_datos.departamento (Cod_departamento, Descripcion, Gerente, Cod_Dep_padre) values (10,'IT',220,NULL);
Insert into bases_datos.departamento (Cod_departamento, Descripcion, Gerente, Cod_Dep_padre) values (11,'bases de datos',210,10);

Update bases_datos.empleado set Cod_Departamento = 10 where Cod_empleado in (220, 210);
Update bases_datos.empleado set Cod_Departamento = 11 where Cod_empleado = 250;

Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (390, 250, 270,'2019-09-16', NULL,400);
Insert into bases_datos.pedido (Nro_pedido, Cod_Cliente, Cod_Empleado, Fecha_pactada_entrega, Fecha_real_entrega, Deposito_entrega)
values (400, 240, 270,'2020-10-20', NULL,400);

Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (390, 200, 20);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (400, 20, 100);
Insert into bases_datos.detalle_pedido(Nro_pedido, Cod_Articulo, Cantidad) values (400, 17, 120);

Insert into bases_datos.art_depo(Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (200, 440, 15, 10);
Insert into bases_datos.art_depo(Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (20, 440, 80, 30);
Insert into bases_datos.art_depo(Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (17, 440, 100, 40);
