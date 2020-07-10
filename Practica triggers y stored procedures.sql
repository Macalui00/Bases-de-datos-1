/*
Crear una tabla factura con la siguiente estructura
	nrofactura int
	cliente varchar(100)
	monto numeric (10,3)
	saldo numeric(10,3)
Crear una tabla pago con la siguiente estructura
	nropago int
	nrofactura int (se refiere al numero de la tabla anterior)
	monto numeric (10,3)

*/

CREATE TABLE `bases_datos`.`factura` (
  `nroFactura` INT NOT NULL,
  `Cliente` VARCHAR(100) NULL,
  `Monto` DECIMAL(10,3) NULL,
  `Saldo` DECIMAL(10,3) NULL,
  PRIMARY KEY (`nroFactura`));
CREATE TABLE `bases_datos`.`pago` (
  `nroPago` INT NOT NULL,
  `NroFact` INT NOT NULL,
  `Monto` DECIMAL(10,3) NULL,
  PRIMARY KEY (`nroPago`),
  INDEX `Factura_idx` (`NroFact` ASC) VISIBLE,
  CONSTRAINT `Factura`
    FOREIGN KEY (`NroFact`)
    REFERENCES `bases_datos`.`factura` (`nroFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -------------------------------------------------------------------------------------------------------------------------    
-- Crear un stored procedure para insertar en la tabla facturas y en la de pagos.

DELIMITER //
CREATE PROCEDURE FacturaPago(IN fact int, IN clientenombre Varchar(100), IN montor decimal(10,3), IN nroDePago INT, IN saldor decimal(10,3))
BEGIN
INSERT INTO factura (nrofactura, cliente, Monto,saldo) values (fact, clientenombre, montor, saldor);
INSERT INTO pago (nroPago, nrofact, monto) values (nroDePago,fact,montor);
END //

Call FacturaPago(10,'Juan Cataneo',500.00,9,400.00);

select * from factura;
select * from pago;

-- delete from factura;
-- delete from pago;
-- -------------------------------------------------------------------------------------------------------------------------
-- Crear un trigger sobre la tabla pagos que cuando se carga un pago sobre una factura
-- actualice el saldo de la misma y controle que el monto pagado no exceda el saldo
-- pendiente de pago.

DELIMITER //
CREATE TRIGGER despues_insercion_pago AFTER INSERT ON pago
FOR EACH ROW
BEGIN
UPDATE factura
SET factura.saldo = (factura.saldo - New.monto)
WHERE factura.saldo >= new.monto and NroFactura = new.NroFact;
END //
DELIMITER ;

-- drop trigger despues_insercion_pago;

INSERT INTO pago (nroPago, nrofact, monto) values (15,10,110.00);
-- -----------------------------------------------------------------------------------------------------------------------
-- Crear una tabla aud_factura (de auditoria) con una estructura igual a la de factura más
-- usuario, fecha, operación.

	/*
	CREATE TABLE `bases_datos`.`aud_factura` (
	  `nroFact` INT NOT NULL,
	  `Cliente` VARCHAR(100) NULL,
	  `Monto` DECIMAL(10,3) NULL,
	  `Saldo` DECIMAL(10,3) NULL,
	  `Usuario` VARCHAR(100) NOT NULL,
	  `Fecha` DATE NOT NULL,
	  `Operacion` VARCHAR(45) NOT NULL,
	  PRIMARY KEY (`nroFact`));
      
CREATE TABLE `bases_datos`.`aud_pagos` (
  `nroPago` INT NOT NULL,
  `nroFact` INT NOT NULL,
  `Monto` DECIMAL(10,3) NULL,
  `Usuario` VARCHAR(100) NOT NULL,
  `Fecha` DATE NOT NULL,
  `operacion` VARCHAR(45) NULL,
  PRIMARY KEY (`nroPago`),
  INDEX `nofact_idx` (`nroFact` ASC) VISIBLE,
  CONSTRAINT `nofact`
    FOREIGN KEY (`nroFact`)
    REFERENCES `bases_datos`.`aud_factura` (`nroFact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	*/

DELIMITER //
CREATE TRIGGER despues_insercion_Aud_pago AFTER INSERT ON pago
FOR EACH ROW
BEGIN
insert into aud_factura (nroFact,saldo, usuario, fecha, operacion) values
(new.nrofact, new.monto, user(), CURDATE(), 'Insercion');

insert into aud_pagos (nropago, nrofact, monto, usuario, fecha, operacion)
values (new.nropago, New.nrofact, New.monto, user(), CURDATE(), 'Insercion')
;
END //
DELIMITER ;

-- drop trigger despues_insercion_Aud_pago;

select * from aud_pagos;
INSERT INTO pago (nroPago, nrofact, monto) values (19,10,100.00);
INSERT INTO pago (nroPago, nrofact, monto) values (30,10,160.00);
INSERT INTO pago (nroPago, nrofact, monto) values (50,10,160.00);

DELIMITER //
CREATE TRIGGER despues_deletear_Aud_fact AFTER DELETE ON factura
FOR EACH ROW
BEGIN
update aud_factura 
set usuario = user(), fecha = CURDATE() , operacion = 'Borrado de linea'
where nroFact = old.nrofactura
;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Antes_delete_Fact BEFORE DELETE ON factura
FOR EACH ROW
BEGIN
delete from pago where pago.NroFact = old.nroFactura
;
END //
DELIMITER ;

-- drop trigger Antes_delete_Fact;
-- drop trigger despues_deletear_Aud_fact;

-- delete from factura;
select * from aud_pagos;
-- ---------------------------------------------------------------------------------------------------------------------------------
/*Crear un stored procedure que reciba como parámetro el nombre de una tabla y
devuelva las primary y foreign key sobre la misma.*/

DELIMITER //
CREATE PROCEDURE primary_y_foreign_keys (IN NombreTabla Varchar(100))
BEGIN
SELECT distinct
  c.TABLE_NAME,
  c.COLUMN_NAME,
  c.CONSTRAINT_NAME,
CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE c, INFORMATION_SCHEMA.TABLE_CONSTRAINTS t
WHERE c.TABLE_NAME = NombreTabla and c.table_name = t.table_name
;
END //
DELIMITER ;

-- DROP PROCEDURE primary_y_foreign_keys;

call primary_y_foreign_keys ('empleado');

-- https://database.guide/11-ways-to-retrieve-a-primary-key-in-sql-server-t-sql-examples/

select CONSTRAINT_TYPE
from information_schema.KEY_COLUMN_USAGE c
where c.table_name = 'empleado';

SELECT CONSTRAINT_CATALOG, CONSTRAINT_SCHEMA, CONSTRAINT_NAME, TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_TYPE, ENFORCED
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

-- -------------------------------------------------------------------------------------------------------
-- Crear un stored procedure que dada una tabla devuelva todas las tablas que tienen
-- definida una foreign - key hacia ella.

select  CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where REFERENCED_TABLE_NAME = 'empleado';

DELIMITER //
CREATE PROCEDURE foreign_keys_a_tabla (IN NombreTabla Varchar(100))
BEGIN
select  CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
where REFERENCED_TABLE_NAME = 'empleado'
;
END //
DELIMITER ;

-- DROP PROCEDURE foreign_keys_a_tabla;

call foreign_keys_a_tabla ('empleado');
-- ------------------------------------------------------------------------------------------------------
select * from INFORMATION_SCHEMA.ROUTINES;

-- Link muy interesante sobre information_schema : https://manuales.guebs.com/mysql-5.0/information-schema.html#:~:text=LIKE%20'wild'%5D-,22.1.2.,en%20las%20bases%20de%20datos.
-- https://manuales.guebs.com/mysql-5.0/triggers.html
-- https://manuales.guebs.com/mysql-5.0/triggers.html#using-triggers
-- https://manuales.guebs.com/mysql-5.0/sql-syntax.html#show-triggers