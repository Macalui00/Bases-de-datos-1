-- Guia 3 Bases de datos I 

-- Simples:

-- Ej 1. Recuperar los números de pedidos y los nombres de los clientes para los pedidos que vencen mañana. 
-- La fecha de entrega representa la fecha en que vence el plazo comprometido con el cliente.
select p.Nro_pedido, c.Razon_Social from bases_datos.pedido p, bases_datos.cliente c where p.Cod_Cliente = c.Cod_Cliente and p.Fecha_real_entrega = '2019-09-18';

-- Recuperar los renglones de todos los pedidos, incluyendo la descripción del artículo 
Select p.Fecha_pactada_entrega Fecha_Entega, p.Fecha_real_entrega, p.Deposito_entrega Deposito_Entrega, d.Nro_pedido, d.Cod_articulo, d.cantidad,
a.Descripcion, a.Tipo_Articulo, a.Precio from bases_datos.articulo a, bases_datos.pedido p, bases_datos.detalle_pedido d where d.Cod_Articulo = a.Cod_Articulo and p.Nro_Pedido = d.Nro_Pedido;

-- Calcular para cada renglón de pedido el costo del mismo (total de renglón más 21% de IVA).
select p.Nro_pedido, p.Cod_Cliente, p.Cod_Empleado, (a.Precio*0.21)+(a.Precio*d.Cantidad) total_a_pagar from bases_datos.detalle_pedido d, bases_datos.pedido p, bases_datos.articulo a 
where p.Nro_Pedido = d.Nro_Pedido and d.Cod_Articulo = a.Cod_Articulo;

-- Listar los datos de los artículos que se encuentren a menos de un 10% de su punto de reorden.  NO ENTENDI LA CONSIGNA

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- Manejo de texto y rangos 

-- Recuperar los apellidos de los empleados (sin repeticiones).
select distinct Apellido from bases_datos.empleado;

-- Recuperar todos los números de los clientes cuyo nombre empiece con M. 
Select Cod_Cliente, Razon_social from bases_datos.cliente where Razon_social like 'M%';

-- Recuperar todos los datos de los empleados de apellido Perez.
select * from bases_datos.empleado where Apellido like 'Perez%';
select * from bases_datos.empleado where Apellido = 'Perez';

-- Recuperar los números de los pedidos que compraron el artículo, 2, 4, 6,8 ó 10 (AR) 
Select d.Nro_pedido, d.Cod_articulo, d.Cantidad from bases_datos.detalle_pedido d where Cod_Articulo in (2,4,6,8,10);

-- Listar los artículos cuyo precio esté entre 20.000 y 50.000. 
Select * from bases_datos.articulo where Precio between '20000.00' and '50000.00';

-- Listar los pedidos que vencen la semana próxima.
-- estoy en el dia 02/06/2020
select * from bases_datos.pedido where Fecha_pactada_entrega between '2020-06-08' and '2020-06-12';

-- Recuperar los pedidos para los cuales no se informó el cliente. 
select * from bases_datos.pedido where Cod_Cliente is NULL;

-- Recuperar los artículos cuya primera letra sea una R o una T y que luego continúan con S500.
select * from bases_datos.articulo where Descripcion like '[RT]S500%';
-- --------------------------------------------------------------------------------------------------------------------------
-- Obtener con subconsultas:

-- Recuperar los nombres de los diferentes artículos que tienen pedidos. 
select distinct a.Descripcion from bases_datos.articulo a, bases_datos.detalle_pedido p where p.Cod_articulo = a.Cod_Articulo ORDER BY Descripcion;

-- Recuperar los artículos que nunca fueron pedidos.
select distinct a.descripcion, a.Cod_Articulo from bases_datos.articulo a LEFT JOIN bases_datos.detalle_pedido p ON a.Cod_Articulo  = (p.Cod_Articulo) where p.Cod_Articulo is null;

-- Recuperar el nombre de los empleados que no efectuaron ningún pedido esta semana. (AR)
select distinct e.nombre, e.apellido, e.Cod_Empleado from bases_datos.empleado e LEFT JOIN bases_datos.pedido p ON e.Cod_Empleado = p.Cod_Empleado where p.Cod_Empleado is null;

-- Listar todos los pedidos ordenados por fecha de entrega decreciente
select * from bases_datos.pedido order by Fecha_real_entrega DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- Funciones de agregado:

-- Recuperar el total de sueldos y el promedio de sueldos para cada departamento.
select sum(e.Sueldo_basico), avg(e.Sueldo_basico), e.Cod_Departamento, d.Descripcion from bases_datos.empleado e, bases_datos.departamento d where e.Cod_departamento = d.Cod_departamento group by e.Cod_Departamento;

-- Recuperar el costo total de cada pedido. 
select SUM(a.Precio*d.Cantidad), d.Nro_pedido from bases_datos.detalle_pedido d, bases_datos.articulo a where d.Cod_Articulo = a.Cod_Articulo Group by d.Nro_Pedido;

-- Recuperar el total de unidades de cada artículo que hay que entregar la próxima semana.
select d.Cod_Articulo, SUM(d.Cantidad) from bases_datos.detalle_pedido d, bases_datos.pedido p where p.Nro_Pedido = d.Nro_Pedido and (p.Fecha_real_entrega between '2020-06-08' and '2020-06-12') group by d.Cod_Articulo;

--  Recuperar los datos de los empleados que tienen más de 3 pedidos pendientes de entrega
Select distinct e.* from bases_datos.empleado e, bases_datos.pedido p where p.Cod_Empleado = e.Cod_Empleado and p.Fecha_real_entrega >'2020-06-02';

-- Recuperar la cantidad de pedidos para cada empleado indicando el código y el nombre del mismo.
select e.nombre, e.apellido, e.Cod_empleado, count(p.Nro_pedido) as Cantidad_Pedidos from bases_datos.empleado e, bases_datos.pedido p where e.Cod_empleado = p.Cod_Empleado group by p.Cod_Empleado;

-- Recuperar la cantidad pedida pendiente de entrega para cada artículo.
select d.Cod_Articulo, count(d.Cantidad) from bases_datos.detalle_pedido d, bases_datos.pedido p where p.Nro_pedido = d.Nro_pedido and p.Fecha_real_entrega >'2020-06-02' group by p.Cod_Empleado;

-- 24. Recuperar los departamentos para los cuales el promedio de sueldo de sus empleados sea superior a 3000.
select case when avg(e.Sueldo_basico) > 3000.00 then d.Descripcion end, avg(e.Sueldo_basico) from departamento d, empleado e where d.Cod_departamento = e.Cod_departamento group by d.Cod_departamento;

-- 25. Recuperar los artículos para los cuales la cantidad pendiente de entrega supere el stock.
-- Los pedidos pendientes de entrega son los que no tienen informado el campo fecha_real_entrega.
select articulo.Descripcion from articulo, pedido, detalle_pedido detped, art_depo
where detped.Cod_Articulo = articulo.Cod_Articulo and pedido.Nro_pedido = detped.Nro_pedido and detped.Cod_Articulo = art_depo.Cod_Articulo
and Fecha_real_entrega is NULL and art_depo.Stock_Actual < detped.Cantidad;

-- 26. Insertar en la tabla Empleados un empleado con todos sus datos.
-- Ya hecho previamente.

-- ----------------------------------------------------------------------------------------------------------------
-- Sentencias de Actualización :

-- 27. Insertar en la tabla Empleados un empleado indicando su código de empleado, su nombre y nulos o defaults en el resto de sus campos.
Insert into bases_datos.empleado(Cod_Empleado, Nombre,Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (340,'Moria','Fernandez',NULL, NULL,NULL, 1.00, NULL, NULL, NULL, NULL);

-- 28. Elegir un empleado y actualizar su domicilio
Update empleado set direccion = 'Acoyte 58' where Cod_Empleado = '340';
SELECT * FROM bases_datos.empleado where Cod_Empleado = '340';

-- 29. Agregar los empleados de la tabla Nuevos_empleados a la tabla Empleados. La tabla nuevos_empleados tiene la misma estructura que
-- la tabla Empleados.

 /* 
 -- Primero Creo la tabla Nuevos_empleados:
 
  CREATE TABLE `bases_datos`.`Nuevos_empleados` (
  `Cod_Empleado` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Codigo_Postal` INT NULL,
  `Cod_Departamento` VARCHAR(45) NOT NULL,
  `Sueldo_basico` FLOAT NOT NULL DEFAULT 0.00,
  `Fecha_Ingreso` DATE NULL,
  `Fecha_Nacimiento` DATE NULL,
  `Telefono` INT NULL,
  `Jefe` INT NULL,
  PRIMARY KEY (`Cod_Empleado`));
  
 -- Modifico algunos errores que tuve
  
 ALTER TABLE `bases_datos`.`nuevos_empleados` 
CHANGE COLUMN `Direccion` `Direccion` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `Cod_Departamento` `Cod_Departamento` INT NULL ,
CHANGE COLUMN `Sueldo_basico` `Sueldo_basico` FLOAT NULL DEFAULT 1 ,
ADD INDEX `Ne_cod_depto_idx` (`Cod_Departamento` ASC) VISIBLE,
ADD INDEX `Ne_jefe_idx` (`Jefe` ASC) VISIBLE;
;
ALTER TABLE `bases_datos`.`nuevos_empleados` 
ADD CONSTRAINT `Cod_depto_ne`
  FOREIGN KEY (`Cod_Departamento`)
  REFERENCES `bases_datos`.`departamento` (`Cod_departamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Jefe_ne`
  FOREIGN KEY (`Jefe`)
  REFERENCES `bases_datos`.`empleado` (`Cod_Empleado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  */
  
-- Ahora inserto nuevos empleados en la tabla Nuevos_empleados:
insert into nuevos_empleados (Cod_Empleado, Nombre, Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (440,'Miguel','Araujo', 'Castelar 508', '1263',10, 5000.00, '2003-01-03', '1980-07-29', 5425173, 100);
insert into nuevos_empleados (Cod_Empleado, Nombre, Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (280,'Juana','Viale', 'Corrientes 5033', '1653',11, 7000.00, '2005-11-10', '1983-08-29', 5366271, 250);
insert into nuevos_empleados (Cod_Empleado, Nombre, Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe)
values (290,'Mariana','Martinez', 'Jose c paz 5033', '1703',11, 3000.00, '2006-04-14', '1987-12-09', 5332275, 250);

-- Inserto los nuevos empleados en tabla empleados:
Insert into empleado 
select Cod_Empleado, Nombre, Apellido, Direccion, Codigo_Postal, Cod_Departamento, Sueldo_basico,Fecha_Ingreso,Fecha_Nacimiento,Telefono,Jefe
from nuevos_empleados;

select * from empleado where Cod_Empleado in (440,280,290);

-- A continuacion borrare los Nuevos empleados de la tabla Nuevos_empleados:
delete from nuevos_empleados where Cod_Empleado in (440,280,290);

-- 30. Eliminar todos los empleados con código postal 9999 
-- No hay ningun empleado en la tabla con ese codigo ni voy a insertar otro pero el codigo a ejecutar es el siguiente:
Delete from empleado where Codigo_Postal = 9999;

-- Dar de alta 3 artículos del tipo C con todos sus datos y uno del tipo B, indicando para este último un stock de 2126 unidades.
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (18,'riñonera', 'C',1500.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (21,'guantes', 'C',788.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (23,'bufanda', 'C',1300.00);
Insert into bases_datos.articulo (Cod_Articulo, Descripcion, Tipo_Articulo, Precio) values (24,'Sopa instantanea', 'B',78.00);

insert into art_depo (Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (18,400,200,100);
insert into art_depo (Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (21,400,500,300);
insert into art_depo (Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (23,400,550,300);
insert into art_depo (Cod_Articulo, Cod_Deposito, Stock_Actual, Punto_Reorden) values (24,400,2126,1000);

-- 32. Todos los artículos del tipo C pasaron a formar parte del tipo A. Actualizar la tabla con 1 instrucción.

-- para que el cambio no sea definitivo ejecuto PRIMERO el START TRANSACTION
START TRANSACTION;

-- ahora si le doy a UPDATE
update bases_datos.articulo set Tipo_Articulo = 'A' where Tipo_Articulo = 'C';

-- Le doy select a la tabla para ver que onda
select * from articulo;

-- le doy rollback para volver atras. IMPORTANTE DAR ROLLBACK o COMMIT despues de un BEGIN TRAN
ROLLBACK;

-- 33. Restar 268 unidades al stock de los artículos de tipo B 
Update art_depo, articulo set Stock_Actual = Stock_Actual - 268 where articulo.Tipo_Articulo = 'B';
SELECT * FROM bases_datos.art_depo;

-- la forma correcta seria:
Update art_depo, articulo set Stock_Actual = Stock_Actual - 268 where articulo.Tipo_Articulo = 'B' and (Stock_Actual - 268) <= 0;

-- Como me olvide de poner el TRANSACCION, voy a setear que los que quedaron en negativo vuelvan a positivo:
UPDATE art_depo set Stock_Actual = 500 where Stock_Actual < 0;

-- 34. Aumentar en un 5,5% el precio de los artículos del grupo A 
Select Descripcion, Precio, Precio + (Precio*5.5)/100 from articulo;

START TRANSACTION;
update articulo set Precio = Precio + (Precio*5.5)/100 where articulo.Tipo_Articulo = 'A';
SELECT * FROM articulo;

COMMIT;
rollback;

-- 35. Disminuir en un 10% el precio de los artículos con el mayor stock.
-- Update articulo set Precio = Precio - (precio*10)/100 where Cod_Articulo IN (select Cod_Articulo from art_depo where Stock_Actual >= (select max(Stock_Actual) from art_depo));

-- START transaction;
update articulo set Precio = Precio - (precio*10)/100 where Cod_Articulo = (select Cod_Articulo from art_depo where Stock_Actual = (select Max(Stock_Actual) from art_depo) );

-- El ideal seria este, todos los que superen el promedio de stock se le actualiza el precio pero como en este caso el promedio es 609, hay solo uno que supera ese numero de stock
-- por lo que no importa si usas el de arriba o este...
update articulo set Precio = Precio - (precio*10)/100 where Cod_Articulo = (select Cod_Articulo from art_depo where Stock_Actual >= (select avg(Stock_Actual) from art_depo) );

-- ROLLBACK;
-- COMMIT;
select Precio - (Precio*10)/100, Precio,(precio*10)/100 from articulo where Cod_Articulo = (select Cod_Articulo from art_depo where Stock_Actual = (select MAX(Stock_Actual) from art_depo) );

select Precio - (Precio*10)/100, Precio,(precio*10)/100 from articulo where Cod_Articulo = (select Cod_Articulo from art_depo where Stock_Actual = (select AVG(Stock_Actual) from art_depo) );

select Cod_Articulo from art_depo where Stock_Actual >= (select AVG(Stock_Actual) from art_depo);
select AVG(Stock_Actual) from art_depo;

-- 36. Aumentar un 20% el sueldo básico de los empleados con el menor sueldo básico.

-- START transaction;
update empleado e set e.sueldo_basico = e.sueldo_basico+(e.Sueldo_basico*20)/100 where e.Sueldo_basico < (select AVG(e2.Sueldo_basico) from empleado e2);

/*
Error Code: 1093. You can't specify target table 'empleado' for update in FROM clause. 
---------------------------------------------------------------------------
In MySQL, you can't modify the same table which you use in the SELECT part.
This behaviour is documented at: http://dev.mysql.com/doc/refman/5.6/en/update.html
*/

-- Una solucion es la siguiente:
update empleado e set e.sueldo_basico = e.sueldo_basico+(e.Sueldo_basico*20)/100 where e.Sueldo_basico < (select AVG(e2.Sueldo_basico) from (SELECT * FROM empleado) as e2);
-- ROLLBACK;
-- COMMIT;
select * from empleado;

Select sueldo_basico, sueldo_basico + (Sueldo_Basico * 20)/100 from empleado where Sueldo_basico < (select AVG(Sueldo_basico) from empleado);
select AVG(Sueldo_basico) from empleado;

-- 37. Aumentar un 15% a los empleados con más de 20 años en la empresa
SELECT TIMESTAMPDIFF(YEAR, fecha_ingreso, CURDATE()), Fecha_Ingreso from empleado;

-- START TRANSACTION
update empleado e set e.sueldo_basico = e.sueldo_basico+(e.Sueldo_basico*15)/100 where Cod_empleado IN
(select e2.Cod_empleado from (SELECT * FROM empleado) as e2 where TIMESTAMPDIFF(YEAR, e2.fecha_ingreso, CURDATE()) >= 20);
-- ROLLBACK;
-- COMMIT;

select e3.Cod_empleado,Fecha_Ingreso from (SELECT * FROM empleado) as e3 where TIMESTAMPDIFF(YEAR, e3.fecha_ingreso, CURDATE()) >=20;

-- 38. Aumentar en $500,00 el sueldo de los jefes de departamento que tengan el menor sueldo básico. 

-- 