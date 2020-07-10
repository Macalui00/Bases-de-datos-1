-- Consulta de objetos del catálogo
-- DIAGRAMA E-R MUY BUENO PARA ENTENDER LAS TABLAS DE INFORMATION_SCHEMA: https://www.jorgeoyhenard.com/modelo-er-del-information-schema-de-mysql-51/906/

-- 1. Escribir un query que informe todos los objetos disponibles en la base de datos
	SELECT 
	   TABLE_NAME, TABLE_TYPE
	FROM INFORMATION_SCHEMA.tables;

-- 2. Escribir un query para obtener todos los objetos creados luego del primero de mes
	SELECT 
	   TABLE_NAME, TABLE_TYPE
	FROM INFORMATION_SCHEMA.tables where CREATE_TIME > '2020-07-01'
    ;
      
-- 3. Escribir un query que informe todas las tablas existentes en la BD
	SELECT 
	   TABLE_NAME, TABLE_TYPE
	FROM INFORMATION_SCHEMA.tables where table_type = 'BASE TABLE'
    AND TABLE_SCHEMA = 'bases_datos'
    ;

-- 4. Escribir un query que informe los constraints de una tabla dada
	SELECT CONSTRAINT_CATALOG, CONSTRAINT_SCHEMA, CONSTRAINT_NAME, TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_TYPE, ENFORCED
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS where table_name = 'empleado';
    
    -- Acá quedaria mejor quiza armar un stored procedure.
    
    DELIMITER //
	CREATE PROCEDURE ConstraInt_Tabla (IN NombreTabla Varchar(100))
	BEGIN
	SELECT CONSTRAINT_CATALOG, CONSTRAINT_SCHEMA, CONSTRAINT_NAME, TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_TYPE, ENFORCED
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
	WHERE TABLE_NAME = NombreTabla
	;
	END //
	DELIMITER ;
	
    call ConstraInt_Tabla ('empleado');
    
-- 5. Escribir un query que informe las columnas de una tabla dada
	Select Table_name, column_name, data_type, column_type, column_key from INFORMATION_SCHEMA.columns where table_name = 'empleado';
    
    DELIMITER //
	CREATE PROCEDURE Informe_Columnas_tabla (IN NombreTabla Varchar(100))
	BEGIN
	Select Table_name, column_name, data_type, column_type, column_key 
    from INFORMATION_SCHEMA.columns
	WHERE TABLE_NAME = NombreTabla
	;
	END //
	DELIMITER ;
	
    call Informe_Columnas_tabla ('empleado');

-- 6. Escribir un query que informe las columnas que componen la clave primaria de una tabla dada
	Select Table_name, column_name, column_key from INFORMATION_SCHEMA.columns where table_name = 'detalle_pedido' and column_key = 'PRI';
    
	DELIMITER //
	CREATE PROCEDURE Informe_ClavesPrimarias_tabla (IN NombreTabla Varchar(100))
	BEGIN
	Select Table_name, column_name, column_key 
    from INFORMATION_SCHEMA.columns
	WHERE TABLE_NAME = NombreTabla and column_key = 'PRI'
	;
	END //
	DELIMITER ;
	
    call Informe_ClavesPrimarias_tabla ('detalle_pedido');
    
-- Obtener información del catálogo
-- 7. Crear un stored procedure que reciba como parámetro el nombre de la tabla y retorne los atributos de la misma indicando su tipo
	
    -- ya hecho arriba

-- 8. Modificar el stored procedure para que informe el nombre de la clave primaria de la tabla

	-- ya hecho arriba
    
-- 9. Escribir un stored procedure que dado el nombre de una tabla indique el nombre y el tipo de los atributos que conforman la clave primaria en el orden correcto
	DELIMITER //
	CREATE PROCEDURE Informe_ClavesPrimarias_tabla2 (IN NombreTabla Varchar(100))
	BEGIN
	Select Table_name, column_name, data_type, column_type, column_key 
    from INFORMATION_SCHEMA.columns
	WHERE TABLE_NAME = NombreTabla and column_key = 'PRI'
	;
	END //
	DELIMITER ;
	
    call Informe_ClavesPrimarias_tabla2 ('detalle_pedido');

-- 10. Crear un stored procedure para obtener los parámetros y el código fuente de un procedimientos determinado
	select SPECIFIC_NAME, ROUTINE_TYPE, ROUTINE_DEFINITION,  CREATED, LAST_ALTERED
	from INFORMATION_SCHEMA.ROUTINES where ROUTINE_TYPE = 'PROCEDURE';
    
	DELIMITER //
	CREATE PROCEDURE Detalle_procedimiento (IN NombreProc Varchar(100))
	BEGIN
	select SPECIFIC_NAME, ROUTINE_TYPE, ROUTINE_DEFINITION,  CREATED, LAST_ALTERED
	from INFORMATION_SCHEMA.ROUTINES where ROUTINE_TYPE = 'PROCEDURE' and SPECIFIC_NAME = NombreProc;
	END //
	DELIMITER ;
	
    call Detalle_procedimiento ('Informe_Columnas_tabla');
    
	-- LA VERSION POSTA PEDIDA:
    
    DELIMITER //
	CREATE PROCEDURE Detalle_proced_VF (IN NombreProc Varchar(100))
	BEGIN
		select r.SPECIFIC_NAME, -- Nombre de la rutina
			r.ROUTINE_TYPE, -- Tipo de rutina
			r.ROUTINE_DEFINITION, -- El código del Stored Procedure
			p.PARAMETER_MODE, -- Indica si es un parámetro de entrada o de salida.
			p.PARAMETER_NAME, -- Nombre del parámetro.
			p.DTD_IDENTIFIER -- La definición del parámetro con su tamaño y precisión.
		from information_schema.routines r,
			information_schema.parameters p
		WHERE r.ROUTINE_SCHEMA = p.SPECIFIC_SCHEMA
		AND r.ROUTINE_NAME = p.SPECIFIC_NAME
		AND r.ROUTINE_NAME = NombreProc;
	END //
	DELIMITER ;
	
    call Detalle_proced_VF ('Informe_Columnas_tabla');
    
	select r.SPECIFIC_NAME, -- Nombre de la rutina
		r.ROUTINE_TYPE, -- Tipo de rutina
		r.ROUTINE_DEFINITION, -- El código del Stored Procedure
		p.PARAMETER_MODE, -- Indica si es un parámetro de entrada o de salida.
		p.PARAMETER_NAME, -- Nombre del parámetro.
		p.DTD_IDENTIFIER -- La definición del parámetro con su tamaño y precisión.
	from information_schema.routines r,
		information_schema.parameters p
	WHERE r.ROUTINE_SCHEMA = p.SPECIFIC_SCHEMA
	AND r.ROUTINE_NAME = p.SPECIFIC_NAME
	AND (r.ROUTINE_NAME) = ('Informe_Columnas_tabla')
    
    -- LINK DE AYUDA: http://software-tecnico-libre.es/es/articulo-por-tema/todas-las-secciones/todos-los-temas/todos-los-articulos/acceso-codigo-fuente-base-de-datos 

-- Armar instrucciones dinámicamente usando el catálogo
-- 11. Escribir un stored procedure para que genere un listado de instrucciones de DROP TABLE para cada tabla de usuario existente. NO EJECUTAR EL RESULTADO.
-- 12. Crear un stored procedure para realizar un SELECT * de todas las tablas de usuario de la BD
-- 13. Crear un stored procedure que genere todos los permisos (GRANT) correspondientes de las tablas y de los stored procedures existentes para un usuario determinado.
