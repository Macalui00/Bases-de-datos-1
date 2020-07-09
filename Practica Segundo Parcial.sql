SELECT * FROM parcial_de_prueba.emp;

INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (1,"Mirta",20);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (2,"Juana",20);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (3,"jose",20);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (4,"ludmila",20);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (5,"miguel",20);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (6,"gabriel",20);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (7,"enrique",21);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (8,"Juan",21);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (9,"Mara",21);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (10,"Aldana",21);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (11,"Florencio",21);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (12,"Carlos",21);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (13,"Julio",22);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (14,"Florencio P.",22);
INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (15,"Carlos Augusto",22);

SELECT distinct COUNT(1) FROM parcial_de_prueba.EMP WHERE emp.edad between '20' AND '30';

SELECT COUNT(1), edad FROM parcial_de_prueba.EMP GROUP BY EDAD HAVING COUNT(1) > 5;
SELECT nombre from parcial_de_prueba.EMP where edad = (select MAX(edad) FROM (SELECT * FROM parcial_de_prueba.EMP) AS e2  HAVING MAX(e2.edad));

SELECT * FROM parcial_de_prueba.llaemp;

INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(1,1,303,'2016-02-20');
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(1,2,303,'2016-02-20');
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(1,3,303,'2016-02-20');
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(1,4,303,'2016-02-20');
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(1,5,303,'2016-02-20');

INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(2,3,301,'2016-02-20');
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(2,4,301,'2016-02-20');
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(2,5,301,'2016-02-20');

INSERT INTO parcial_de_prueba.lla (Numero) VALUES (1);
INSERT INTO parcial_de_prueba.lla (Numero) VALUES (2);
INSERT INTO parcial_de_prueba.lla (Numero) VALUES (3);

/*
ALTER TABLE `parcial_de_prueba`.`llaemp` 
ADD CONSTRAINT `Nro_llamada`
  FOREIGN KEY (`Numero`)
  REFERENCES `parcial_de_prueba`.`lla` (`Numero`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;*/
  
SELECT Numero, COUNT(1) AS Cantidad_de_Pasos FROM LLAEMP GROUP BY Numero;

UPDATE llaemp SET Fecha = curdate();

SELECT DISTINCT emp.nombre FROM emp JOIN llaemp ON emp.codemp = llaemp.codemp where llaemp.Fecha = CURDATE();

-- INSERT INTO parcial_de_prueba.emp (codemp, nombre, edad) values (3,"jose",20);
SELECT * FROM parcial_de_prueba.emp;

INSERT INTO emp
SELECT 
		16,
		"Juan",
		emp.edad,
		emp.categoria,
		emp.FecIng
FROM parcial_de_prueba.emp
WHERE emp.codemp = 3;

SELECT TIMESTAMPDIFF(DAY,'2020-05-01',CURDATE()); 
SELECT TIMEDIFF(Day,'2007-12-31','2007-12-30');

UPDATE emp SET FecIng = '2020-05-01';
SELECT DISTINCT emp.nombre FROM emp JOIN llaemp ON emp.codemp = llaemp.codemp where llaemp.Fecha = CURDATE();

SELECT DISTINCT emp.nombre, emp.FecIng
FROM emp 
LEFT JOIN llaemp ON emp.codemp = llaemp.codemp
where llaemp.codemp IS NULL AND TIMESTAMPDIFF(DAY,emp.FecIng,CURDATE()) > 7
ORDER BY emp.nombre;

Select * from emptema;
INSERT INTO emptema (Codemp, Codtema) VALUES (1,1);
INSERT INTO emptema (Codemp, Codtema) VALUES (1,2);
INSERT INTO emptema (Codemp, Codtema) VALUES (1,3);
INSERT INTO emptema (Codemp, Codtema) VALUES (2,1);
INSERT INTO emptema (Codemp, Codtema) VALUES (2,3);
INSERT INTO emptema (Codemp, Codtema) VALUES (2,4);
INSERT INTO emptema (Codemp, Codtema) VALUES (12,1);
INSERT INTO emptema (Codemp, Codtema) VALUES (12,3);
INSERT INTO emptema (Codemp, Codtema) VALUES (12,4);

SELECT * FROM lla;
UPDATE LLA SET Tema = '1' where numero = 1;
UPDATE LLA SET Tema = '3' where numero = 2;
UPDATE LLA SET Tema = '4' where numero = 3;
INSERT INTO LLA (Numero, Tema) VALUES (4,2);

/* NO ME SALIOOOOOOOO 
SELECT nombre FROM EMP
JOIN LLAEMP on llaemp.codemp = EMP.codemp;

SELECT distinct nombre, emp.codemp FROM EMP
LEFT JOIN llaemp ON emp.codemp = llaemp.codemp 
WHERE llaemp.codemp is null and Fecha = '2020-06-13';

SELECT distinct codtema, nombre, emp.codemp FROM EMP
JOIN emptema on emptema.codemp = EMP.codemp
LEFT JOIN llaemp ON emp.codemp = llaemp.codemp
JOIN lla ON emptema.codtema = lla.tema
WHERE llaemp.codemp is null;
*/
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(3,1,303,curdate());
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(3,2,303,curdate());
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(3,3,303,curdate());
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(3,4,303,curdate());
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(3,5,303,curdate());

INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(4,3,301,curdate());
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(4,4,301,curdate());
INSERT INTO  parcial_de_prueba.llaemp (Numero, CodEmp, NroOrden, Fecha) VALUES(4,5,301,curdate());

SELECT nombre FROM EMP
JOIN EMPTEMA ON emptema.codemp = emp.codemp
WHERE codtema IN(2,3);

-- -------------------
-- OTRO PARCIAL DE PRACTICA:
/*
ALTER TABLE `parcial_de_prueba`.`persona`
ADD CONSTRAINT `Sexo` CHECK (`Sexo` IN ('M','F'))
*/
/*ALTER TABLE `parcial_de_prueba`.`persona_mesa`
ADD CONSTRAINT `Documento`
  FOREIGN KEY (`NroDocumento`)
  REFERENCES `parcial_de_prueba`.`persona`(`NroDocumento`);
*/
select * from persona;

INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (123,'F','Lopez','Gerardo',30);
INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (124,'M','Armando','Gabriel',32);
INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (125,'F','Luilli','Ludmila',24);
INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (126,'F','Gutierrez','Jacinta',45);

INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (130,'M','Lui','Ramon',30);
INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (131,'M','Dominguez','Gabriel',32);
INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (132,'F','Ferrari','Mariana',24);
INSERT INTO persona(NroDocumento, Sexo, Apellido, Nombre, edad) values (133,'F','Kazka','Antonella',45);

Update persona set nombre = 'Guillermina' where NroDocumento = 123;

select * from mesa;

INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (1,'Rivadavia 5544','F',3);
INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (2,'Rivadavia 5544','F',3);
INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (3,'Rivadavia 5544','M',3);
INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (4,'Rivadavia 6600','F',6);
INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (5,'Rivadavia 7895','F',5);

INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (2387,'av. de mayo 6600','M',7);
INSERT INTO mesa(IdMesa, Direccion, Sexo, IdBarrio) values (9087,'virrey liniers 7895','F',8);

select * from persona_mesa;

INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (123,1,3);
INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (124,3,5);
INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (125,4,6);
INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (126,2,7);

INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (130,2387,3);
INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (131,2387,5);
INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (132,9087,6);
INSERT INTO persona_mesa(NroDocumento, IdMesa, NroOrden) values (133,9087,7);

SELECT DISTINCT Nombre, NroOrden FROM Persona JOIN Persona_Mesa ON Persona.NroDocumento = Persona_Mesa.NroDocumento;

SELECT DISTINCT Nombre, NroOrden FROM Persona, Persona_Mesa WHERE Persona_Mesa.NroDocumento = Persona.NroDocumento;

/*
ALTER TABLE `parcial_de_prueba`.`persona_cargo_mesa`
ADD CONSTRAINT `Doc`
  FOREIGN KEY (`NroDocumento`)
  REFERENCES `parcial_de_prueba`.`persona`(`NroDocumento`);
ADD CONSTRAINT `NumMesa`
  FOREIGN KEY (`IdMesa`)
  REFERENCES `parcial_de_prueba`.`mesa`(`IdMesa`);
ADD CONSTRAINT `NumCargo`
  FOREIGN KEY (`IdCargo`)
  REFERENCES `parcial_de_prueba`.`cargos`(`IdCargo`);
*/

select * from cargos;

INSERT INTO cargos(IdCargo, DescripcionCargo) values (1,'Presidente de Mesa');
INSERT INTO cargos(IdCargo, DescripcionCargo) values (2,'Secretario');
INSERT INTO cargos(IdCargo, DescripcionCargo) values (3,'Fiscal');

select * from persona_cargo_mesa;

INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (123, 1, 1);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (124, 3, 2);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (125, 2, 3);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (124, 2, 2);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (125, 4, 3);

INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (130, 2387, 2);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (131, 2387, 3);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (132, 9087, 2);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (133, 9087, 3);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (130, 9087, 1);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (131, 9087, 1);


SELECT nombre FROM persona
JOIN persona_cargo_mesa cargo ON persona.NroDocumento = cargo.NroDocumento
Group by cargo.NroDocumento
having count(1) >= 2;

SELECT nombre FROM persona WHERE NroDocumento in 
(SELECT NroDocumento FROM persona_cargo_mesa 
group by NroDocumento having count(1) >= 2);

-- Indicar los nombres de las personas que son autoridades de las mesas 2387 y 9087 (de ambas al mismo tiempo). Resolver este ejercicio de 2 formas diferentes. (AR)
Select distinct a.nombre from
(SELECT nombre FROM persona
JOIN persona_cargo_mesa cargo ON persona.NroDocumento = cargo.NroDocumento
WHERE cargo.idmesa = 2387) a
JOIN 
(SELECT nombre FROM persona
JOIN persona_cargo_mesa cargo ON persona.NroDocumento = cargo.NroDocumento
WHERE cargo.idmesa = 9087) b
ON a.nombre = b.nombre;

Select a.nombre from
(SELECT nombre FROM persona
JOIN persona_cargo_mesa cargo ON persona.NroDocumento = cargo.NroDocumento
WHERE cargo.idmesa = 2387) a
where EXISTS
(SELECT nombre FROM persona
JOIN persona_cargo_mesa cargo ON persona.NroDocumento = cargo.NroDocumento
WHERE cargo.idmesa = 9087);

SELECT nombre FROM persona
JOIN persona_mesa ON persona.NroDocumento = persona_mesa.NroDocumento
WHERE IdMesa = 28 AND edad BETWEEN 20 AND 30;

Select a.nombre from
(SELECT nombre FROM persona
JOIN persona_mesa ON persona.NroDocumento = persona_mesa.NroDocumento
WHERE IdMesa = 28 AND edad >= 20) a
WHERE EXISTS(
SELECT nombre FROM persona
JOIN persona_mesa ON persona.NroDocumento = persona_mesa.NroDocumento
WHERE IdMesa = 28 AND edad <= 30)
;

SELECT COUNT(1) AS Cantidad_de_personas, Direccion AS Direccion_de_Mesa 
FROM mesa
JOIN persona_mesa ON persona_mesa.IdMesa = mesa.IdMesa
GROUP BY persona_mesa.IdMesa;

SELECT COUNT(1) AS Cantidad_de_personas, Direccion AS Direccion_de_Mesa 
FROM mesa,persona_mesa 
WHERE persona_mesa.IdMesa = mesa.IdMesa
GROUP BY persona_mesa.IdMesa;

-- -------------------------
SELECT COUNT(1) AS Cantidad_de_personas, Direccion AS Direccion_de_Mesa 
FROM mesa
JOIN persona_mesa ON persona_mesa.IdMesa = mesa.IdMesa
GROUP BY persona_mesa.IdMesa
HAVING COUNT(1) > 3000;

SELECT COUNT(1) AS Cantidad_de_personas, Direccion AS Direccion_de_Mesa 
FROM mesa,persona_mesa 
WHERE persona_mesa.IdMesa = mesa.IdMesa
GROUP BY persona_mesa.IdMesa
HAVING COUNT(1) > 3000;
-- -------------------------------------------------------
SELECT nombre FROM persona
WHERE persona.edad = (SELECT Max(edad) FROM persona);

SELECT nombre FROM persona, (SELECT Max(edad) as edad2 FROM persona) b
WHERE persona.edad = b.edad2;

-- --------------------------------------------------------
select * from persona_cargo_mesa;

INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (123, 5, 99);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (124, 5, 99);
INSERT INTO persona_cargo_mesa(NroDocumento, IdMesa, IdCargo) values (125, 5, 99);

INSERT INTO persona_cargo_mesa SELECT NroDocumento, 3, IdCargo FROM persona_cargo_mesa WHERE IdMesa = 5;

-- -----
SELECT DISTINCT nombre, DescripcionCargo From persona
JOIN persona_cargo_mesa cargo_mesa ON persona.NroDocumento = cargo_mesa.NroDocumento
right join cargos ON cargo_mesa.IdCargo = cargos.IdCargo 
WHERE (IdMesa = 1 and cargo_mesa.IdCargo is null) or (IdMesa = 1 and cargo_mesa.IdCargo is not null);

SELECT distinct DescripcionCargo From cargos
left join persona_cargo_mesa  cargo_mesa ON cargos.IdCargo = cargo_mesa.IdCargo 
WHERE(IdMesa = 1 and cargos.IdCargo is not null);


SELECT DISTINCT NOMBRE,DescripcionCargo From PERSONA, cargos, persona_cargo_mesa
WHERE (persona.NroDocumento = persona_cargo_mesa.NroDocumento AND IdMesa = 1) and ( (IdMesa = 1 AND cargos.IdCargo = persona_cargo_mesa.IdCargo) OR cargos.IdCargo NOT IN (SELECT IdCargo FROM persona_cargo_mesa WHERE IdMesa = 1));

-- -------------------------------------------------
SELECT * FROM parcial_de_prueba.barrios;

INSERT INTO barrios(idBarrio, NombreDelBarrio) values (3,'caballito');
INSERT INTO barrios(idBarrio, NombreDelBarrio) values (6,'villa crespo');
INSERT INTO barrios(idBarrio, NombreDelBarrio) values (5,'parque patricios');
INSERT INTO barrios(idBarrio, NombreDelBarrio) values (7,'microcentro');
INSERT INTO barrios(idBarrio, NombreDelBarrio) values (8,'vicente lopez');
INSERT INTO barrios(idBarrio, NombreDelBarrio) values (1,'Barracas');
INSERT INTO barrios(idBarrio, NombreDelBarrio) values (2,'Once');

select nombredelbarrio from barrios
left JOIN mesa on barrios.IdBarrio = mesa.idbarrio
where mesa.IdBarrio is null;

SELECT nombredelbarrio FROM barrios WHERE idBarrio NOT IN (SELECT idBarrio FROM mesa);

-- ---------
select * from Viaje;
-- a)	Listar el id de viaje, la fecha y la hora de salida, y el nombre del de los pasajeros para cada uno de los viajes que salen la semana que viene.
SELECT viaje.IdViaje, FechaViaje, HoraViaje, Nombre FROM Viaje
JOIN Pasajero_Viaje ON pasajero_Viaje.idViaje=Viaje.idViaje
JOIN pasajero ON pasajero.idPasajero = pasajero_Viaje.idPasajero
having TIMESTAMPDIFF(Day,CURDATE(),fechaViaje) >= 7 and TIMESTAMPDIFF(Day,CURDATE(),fechaViaje) <= 14;

SELECT * FROM MICRO;
SELECT * FROM PASAJERO_VIAJE;
SELECT * FROM PASAJERO;

INSERT INTO MICRO (idMicro, Chapa, CantAsientos) VALUES (1,242343,45);
INSERT INTO MICRO (idMicro, Chapa, CantAsientos) VALUES (2,242533,50);
INSERT INTO MICRO (idMicro, Chapa, CantAsientos) VALUES (3,242456,40);
INSERT INTO MICRO (idMicro, Chapa, CantAsientos) VALUES (4,242336,50);

INSERT INTO VIAJE (idViaje, FechaViaje, HoraViaje, IdMicro) VALUES (1,'2020-06-25','5:00:00',1);
INSERT INTO VIAJE (idViaje, FechaViaje, HoraViaje, IdMicro) VALUES (2,'2020-06-26','6:00:00',2);
INSERT INTO VIAJE (idViaje, FechaViaje, HoraViaje, IdMicro) VALUES (3,'2020-06-26','7:00:00',3);
INSERT INTO VIAJE (idViaje, FechaViaje, HoraViaje, IdMicro) VALUES (4,'2020-06-27','8:00:00',4);

INSERT INTO PASAJERO (idPasajero, Nombre) VALUES (1,'Emilio Ortiz');
INSERT INTO PASAJERO (idPasajero, Nombre) VALUES (2,'Gonzalo Lopez');
INSERT INTO PASAJERO (idPasajero, Nombre) VALUES (3,'Rosalia Lopez');
INSERT INTO PASAJERO (idPasajero, Nombre) VALUES (4,'Emilia Muñoz');

INSERT INTO PASAJERO_VIAJE (idPasajero, idViaje, CantPasajes) VALUES (1,1,5);
INSERT INTO PASAJERO_VIAJE (idPasajero, idViaje, CantPasajes) VALUES (2,2,2);
INSERT INTO PASAJERO_VIAJE (idPasajero, idViaje, CantPasajes) VALUES (3,3,3);
INSERT INTO PASAJERO_VIAJE (idPasajero, idViaje, CantPasajes) VALUES (4,4,1);

-- b)	La Chapa del micro con mayor cantidad de asientos que tenemos.
SELECT chapa FROM MICRO WHERE CantAsientos = (SELECT max(CantAsientos) FROM MICRO);

-- ----
SELECT * FROM CHOFER;
SELECT * FROM CHOFER_VIAJE;

INSERT INTO CHOFER (idChofer, Nombre, NumLicencia, Antiguedad) VALUES (1,'Julio Benitez',10231,3);
INSERT INTO CHOFER (idChofer, Nombre, NumLicencia, Antiguedad) VALUES (2,'Dora Ibañez',10223,1);
INSERT INTO CHOFER (idChofer, Nombre, NumLicencia, Antiguedad) VALUES (3,'Antonia Flores',10265,0);
INSERT INTO CHOFER (idChofer, Nombre, NumLicencia, Antiguedad) VALUES (4,'Alberto Juanes',10263,13);

INSERT INTO CHOFER_VIAJE (idChofer, IdViaje, MontoAPagarAlChofer) VALUES (4,1,3000.00);
INSERT INTO CHOFER_VIAJE (idChofer, IdViaje, MontoAPagarAlChofer) VALUES (4,2,3000.00);
INSERT INTO CHOFER_VIAJE (idChofer, IdViaje, MontoAPagarAlChofer) VALUES (3,1,3000.00);
INSERT INTO CHOFER_VIAJE (idChofer, IdViaje, MontoAPagarAlChofer) VALUES (4,4,3000.00);

SELECT viaje.IdViaje, HoraViaje,nombre FROM viaje
JOIN chofer_viaje ON viaje.IdViaje = chofer_viaje.idviaje
Right Join chofer ON chofer_viaje.idchofer = chofer.idchofer
where chofer_Viaje.idChofer is null or chofer_viaje.idchofer is not null;

SELECT viaje.* FROM Viaje
JOIN pasajero_Viaje ON Viaje.idViaje = pasajero_Viaje.idViaje
group by idViaje
HAVING sum(cantpasajes) > 20 and TIMESTAMPDIFF(month,CURDATE(),fechaViaje) = 0;

SELECT viaje.* FROM Viaje
HAVING TIMESTAMPDIFF(month,CURDATE(),fechaViaje) = 0;

-- viaje y viaje destino
select * from viaje;
select * from viaje_destino;

INSERT INTO viaje SELECT 5, FechaViaje, HoraViaje, IdMicro FROM viaje where idviaje = 154;

INSERT INTO VIAJE_DESTINO (idViaje, idDestino) VALUES (4,2);
INSERT INTO VIAJE_DESTINO (idViaje, idDestino) VALUES (4,3);
INSERT INTO VIAJE_DESTINO (idViaje, idDestino) VALUES (4,1);

INSERT INTO viaje_destino SELECT 5,idDestino FROM viaje_destino where idviaje = 154;

delete from viaje where 
TIMESTAMPDIFF(day,CURDATE(),fechaViaje) = 1 and idviaje in 
(SELECT idviaje FROM pasajero_viaje
group by idViaje
HAVING sum(cantpasajes)= 0);

delete from Pasajero_viaje where 
TIMESTAMPDIFF(day,CURDATE(),fechaViaje) = 1 and idviaje in 
(SELECT idviaje FROM pasajero_viaje
group by idViaje
HAVING sum(cantpasajes)= 0);

delete from viaje_destino where 
TIMESTAMPDIFF(day,CURDATE(),fechaViaje) = 1 and idviaje in 
(SELECT idviaje FROM pasajero_viaje
group by idViaje
HAVING sum(cantpasajes)= 0);

delete from chofer_viaje where 
TIMESTAMPDIFF(day,CURDATE(),fechaViaje) = 1 and idviaje in 
(SELECT idviaje FROM pasajero_viaje
group by idViaje
HAVING sum(cantpasajes)= 0);

-- ---------

SELECT * FROM parcial_de_prueba.destino;
INSERT INTO destino(idDestino, CantHabitantes) VALUES (2,500);
INSERT INTO destino(idDestino, CantHabitantes) VALUES (3,2000);
INSERT INTO destino(idDestino, CantHabitantes) VALUES (1,20000);

INSERT INTO destino(idDestino, CantHabitantes, descripciondestino) VALUES (4,20000, 'Mar de las Pampas');
INSERT INTO destino(idDestino, CantHabitantes, descripciondestino) VALUES (5,4000, 'Pinamar');

update destino set descripciondestino = 'Margaritas' where canthabitantes = 500;
update destino set descripciondestino = 'Pehuajo' where canthabitantes = 2000;
update destino set descripciondestino = 'Mar del Plata' where canthabitantes = 20000;

SELECT descripciondestino FROM DESTINO
JOIN VIAJE_DESTINO ON VIAJE_DESTINO.IDDESTINO = DESTINO.IDDESTINO
JOIN VIAJE ON VIAJE_DESTINO.IDVIAJE = VIAJE.IDVIAJE
HAVING TIMESTAMPDIFF(DAY,CURDATE(),fechaViaje) = 1 or TIMESTAMPDIFF(DAY,CURDATE(),fechaViaje) = 0; 

SELECT * FROM parcial_de_prueba.prefiereviajarcon;
INSERT INTO prefiereviajarcon(idChofer, idPreferido) VALUES (1,2);
INSERT INTO prefiereviajarcon(idChofer, idPreferido) VALUES (3,2);
INSERT INTO prefiereviajarcon(idChofer, idPreferido) VALUES (4,2);

SELECT NOMBRE, count(1) FROM CHOFER
JOIN PREFIEREVIAJARCON ON PREFIEREVIAJARCON.IDPREFERIDO = CHOFER.IDCHOFER
GROUP BY IDPREFERIDO;

