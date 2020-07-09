/*No estan las queries de todas las tablas que cree ni de todos sus cambios, pero para una leve idea de como hacerlo seguro sirve:*/

/*
CREATE TABLE `bases_datos`.`ped` (
  `Nro_pedido` INT NOT NULL,
  `Cod_Cliente` INT NOT NULL,
  `Cod_Empleado` INT NOT NULL,
  `Fecha_pactada_entrega` DATE NULL,
  `Fecha_real_entrega` DATE NULL,
  `Deposito_entrega` INT NOT NULL,
  PRIMARY KEY (`Nro_pedido`));
*/

/*CREATE TABLE `bases_datos`.`empleado` (
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
*/

/*
ALTER TABLE `bases_datos`.`empleado` 
ADD INDEX `jefe_idx` (`Jefe` ASC) VISIBLE;
;
ALTER TABLE `bases_datos`.`empleado` 
ADD CONSTRAINT `jefe`
  FOREIGN KEY (`Jefe`)
  REFERENCES `bases_datos`.`empleado` (`Cod_Empleado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/
/*
ALTER TABLE `bases_datos`.`empleado`
ADD CONSTRAINT `sueldo_basico` CHECK (`sueldo_basico`>0)*/
/*
ALTER TABLE `bases_datos`.`emp`
ADD CONSTRAINT `sueldo` CHECK (`sueldo`>0)*/

/*ALTER TABLE `bases_datos`.`empleado` 
DROP FOREIGN KEY `Cod_Depto`,
DROP FOREIGN KEY `jefe`;
ALTER TABLE `bases_datos`.`empleado` 
CHANGE COLUMN `Cod_Departamento` `Cod_Departamento` INT NULL ,
CHANGE COLUMN `Jefe` `Jefe` INT NULL ;
ALTER TABLE `bases_datos`.`empleado` 
ADD CONSTRAINT `Cod_Depto`
  FOREIGN KEY (`Cod_Departamento`)
  REFERENCES `bases_datos`.`departamento` (`Cod_departamento`),
ADD CONSTRAINT `jefe`
  FOREIGN KEY (`Jefe`)
  REFERENCES `bases_datos`.`empleado` (`Cod_Empleado`);
*/

/*CREATE TABLE `bases_datos`.`cliente` (
  `Cod_Cliente` INT NOT NULL,
  `Razon_social` VARCHAR(45) NULL,
  `Direccion` VARCHAR(85) NULL,
  PRIMARY KEY (`Cod_Cliente`));*/
  
  /*CREATE TABLE `bases_datos`.`deposito` (
  `Cod_deposito` INT NOT NULL,
  `Ubicacion_deposito` VARCHAR(100) NULL,
  PRIMARY KEY (`Cod_deposito`));
*/
/*CREATE TABLE `bases_datos`.`departamento` (
  `Cod_departamento` INT NOT NULL,
  `Descripcion` VARCHAR(100) NULL,
  `Gerente` INT NOT NULL,
  `Cod_Dep_padre` INT NOT NULL,
  PRIMARY KEY (`Cod_departamento`),
  INDEX `Gerente_idx` (`Gerente` ASC) VISIBLE,
  CONSTRAINT `Gerente`
    FOREIGN KEY (`Gerente`)
    REFERENCES `bases_datos`.`empleado` (`Cod_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);*/
    
/*ALTER TABLE `bases_datos`.`departamento` 
ADD INDEX `Cod_Depto_padre_idx` (`Cod_Dep_padre` ASC) VISIBLE;
;
ALTER TABLE `bases_datos`.`departamento` 
ADD CONSTRAINT `Cod_Depto_padre`
  FOREIGN KEY (`Cod_Dep_padre`)
  REFERENCES `bases_datos`.`departamento` (`Cod_departamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/

/*ALTER TABLE `bases_datos`.`empleado` 
CHANGE COLUMN `Cod_Departamento` `Cod_Departamento` INT NOT NULL ,
ADD INDEX `Cod_Depto_idx` (`Cod_Departamento` ASC) VISIBLE;
;
ALTER TABLE `bases_datos`.`empleado` 
ADD CONSTRAINT `Cod_Depto`
  FOREIGN KEY (`Cod_Departamento`)
  REFERENCES `bases_datos`.`departamento` (`Cod_departamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/

/*
CREATE TABLE `bases_datos`.`articulo` (
  `Cod_Articulo` INT NOT NULL,
  `Descripcion` VARCHAR(100) NULL,
  `Tipo_Articulo` VARCHAR(5) NOT NULL,
  `Precio` FLOAT NOT NULL,
  PRIMARY KEY (`Cod_Articulo`));
*/
/*
-- Elimine este CONTRAINT
ALTER TABLE `bases_datos`.`articulo`
ADD CONSTRAINT `Tipo_Articulo` CHECK (`Tipo_Articulo`= 'A' OR `Tipo_Articulo`= 'B' OR `Tipo_Articulo`= 'C');
*/

 /*
 CREATE TABLE `bases_datos`.`art_depo` (
  `Cod_Articulo` INT NOT NULL,
  `Cod_Deposito` INT NOT NULL,
  `Stock_Actual` INT NULL,
  `Punto_Reorden` INT NULL,
  PRIMARY KEY (`Cod_Articulo`, `Cod_Deposito`));
  
  No me deja setear articulo y deposito como FK tambien*/
  
  /*ALTER TABLE `bases_datos`.`ped` 
ADD INDEX `Cod_Cliente_idx` (`Cod_Cliente` ASC) VISIBLE,
ADD INDEX `Cod_Empleado_idx` (`Cod_Empleado` ASC) VISIBLE,
ADD INDEX `Deposito_entrega_idx` (`Deposito_entrega` ASC) VISIBLE;
;
ALTER TABLE `bases_datos`.`ped` 
ADD CONSTRAINT `Cod_Cliente`
  FOREIGN KEY (`Cod_Cliente`)
  REFERENCES `bases_datos`.`cliente` (`Cod_Cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Cod_Empleado`
  FOREIGN KEY (`Cod_Empleado`)
  REFERENCES `bases_datos`.`empleado` (`Cod_Empleado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Deposito_entrega`
  FOREIGN KEY (`Deposito_entrega`)
  REFERENCES `bases_datos`.`deposito` (`Cod_deposito`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/

/*
CREATE TABLE `bases_datos`.`detalle_pedido` (
  `Nro_Pedido` INT NOT NULL,
  `Cod_Articulo` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`Nro_Pedido`, `Cod_Articulo`));
  
  ALTER TABLE `bases_datos`.`detalle_pedido` 
ADD CONSTRAINT `Nro_Pedido`
  FOREIGN KEY (`Nro_Pedido`)
  REFERENCES `bases_datos`.`ped` (`Nro_pedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/

/*
ALTER TABLE `bases_datos`.`ped` 
RENAME TO  `bases_datos`.`pedido` ;


ALTER TABLE `bases_datos`.`art_depo` 
ADD CONSTRAINT `Cod_Articulo`
  FOREIGN KEY (`Cod_Articulo`)
  REFERENCES `bases_datos`.`articulo` (`Cod_Articulo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `bases_datos`.`art_depo` 
ADD CONSTRAINT `Cod_Deposito`
  FOREIGN KEY (`Cod_Deposito`)
  REFERENCES `bases_datos`.`deposito` (`Cod_deposito`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  */
  
  /*
ALTER TABLE `bases_datos`.`detalle_pedido` 
ADD CONSTRAINT `Nro_Pedido`
  FOREIGN KEY (`Nro_Pedido`)
  REFERENCES `bases_datos`.`pedido` (`Nro_pedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
-- 19:13:33ALTER TABLE `bases_datos`.`detalle_pedido`  ADD CONSTRAINT `Cod_Articulo`   FOREIGN KEY (`Cod_Articulo`)   REFERENCES `bases_datos`.`articulo` (`Cod_Articulo`)   ON DELETE NO ACTION   ON UPDATE NO ACTION
-- Error Code: 1826. Duplicate foreign key constraint name 'Cod_Articulo'	0.000 sec
-- Ese error sucede cuando tratas de generar un CONSTRAINT a una tabla con nombre ya existente en la misma.

ALTER TABLE `bases_datos`.`detalle_pedido` 
ADD CONSTRAINT `NArticulo`
  FOREIGN KEY (`Cod_Articulo`)
  REFERENCES `bases_datos`.`articulo` (`Cod_Articulo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  */
  
  /*
  ALTER TABLE `bases_datos`.`pedido` 
DROP FOREIGN KEY `Cod_Cliente`;
ALTER TABLE `bases_datos`.`pedido` 
CHANGE COLUMN `Cod_Cliente` `Cod_Cliente` INT NULL DEFAULT NULL ;
ALTER TABLE `bases_datos`.`pedido` 
ADD CONSTRAINT `Cod_Cliente`
  FOREIGN KEY (`Cod_Cliente`)
  REFERENCES `bases_datos`.`cliente` (`Cod_Cliente`);
  */
  