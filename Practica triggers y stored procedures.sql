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
    
-- Crear un stored procedure para insertar en la tabla facturas y en la de pagos.
/*
DELIMITER //
CREATE PROCEDURE FacturaPago(IN fact int, IN clientenombre Varchar(100), IN montor decimal(10,3), IN nroDePago INT, IN saldor decimal(10,3))
BEGIN
INSERT INTO factura (nrofactura, cliente, Monto,saldo) values (fact, clientenombre, montor, saldor);
INSERT INTO pago (nroPago, nrofact, monto) values (nroDePago,fact,montor);
END //
*/

Call FacturaPago(10,'Juan Cataneo',500.00,9,400.00);

select * from factura;
select * from pago;

-- delete from factura;
-- delete from pago;

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

-- NO ESTARIA FUNCANDO
DELIMITER //
CREATE TRIGGER despues_insercion_Aud_pago AFTER INSERT ON pago
FOR EACH ROW
BEGIN
update aud_pagos
set aud_pagos.nropago = new.nropago,
aud_pagos.nroFact = New.nrofact,
aud_pagos.monto = New.monto,
aud_pagos.usuario = user(),
aud_pagos.fecha =  CURDATE(),
aud_pagos.operacion = 'Insercion en pago'
;
END //
DELIMITER ;

drop trigger despues_insercion_Aud_pago;

select * from aud_pagos;
INSERT INTO pago (nroPago, nrofact, monto) values (19,10,100.00);