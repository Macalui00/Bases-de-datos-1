SELECT * FROM parcial.articulos;
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(1,400.00,20);
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(2,40000.00,100);
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(3,4000.00,50);
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(4,40.00,3000);
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(5,4100.00,30000);
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(6,3000.00,350);
Insert into articulos (CodigoArticulo, Precio, CantidadStock) values(7,100.00,30);

SELECT * FROM parcial.casamiento;
Insert into casamiento (CodigoCasamiento, Fecha, Comentario) values(1,curdate(),'Marcelo y viviana');
Insert into casamiento (CodigoCasamiento, Fecha, Comentario) values(2,'2020-06-17','Marcelo y viviana');
Insert into casamiento (CodigoCasamiento, Fecha, Comentario) values(3,'2020-02-14','Marcelo y viviana');

SELECT * FROM regalos where codigocasamiento IN (2,3);
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(1,1,30,'S');
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(1,2,30,'S');
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(1,3,30,'S');
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(2,1,30,'S');
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(2,2,30,'S');
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(2,3,30,'S');

Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(5,2,200,'S');

Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(4,2,30,'S');
Insert into regalos (CodigoArticulo, CodigoCasamiento, CantidadRequerida, Regalado) values(3,3,30,'S');

select * from novios;

Insert into novios (CodigoCasamiento, NombreNovio, ApellidoNovio) values(1,'Juan','Suarez');
Insert into novios (CodigoCasamiento, NombreNovio, ApellidoNovio) values(2,'Osvaldo','Dominguez');



select nombrenovio from novios where ((codigocasamiento IN (Select codigocasamiento from regalos where CantidadRequerida >=200))) or codigocasamiento IN (Select codigocasamiento from regalos Group by codigocasamiento having count(1) >= 200);

select nombrenovio from novios where codigocasamiento IN (Select p.codigocasamiento from (Select codigocasamiento,SUM(cantidadrequerida) from regalos Group by codigocasamiento having SUM(cantidadrequerida) >= 200) p);


select codigoarticulo from regalos where codigocasamiento = 2 and codigoarticulo IN (select codigoarticulo from regalos where codigocasamiento = 3);

select distinct a.codigoarticulo from regalos a
Left JOIN regalos b on a.codigoarticulo = b.codigoarticulo
where b.codigoarticulo is not null
;

select* from detalleenvio;
Insert into detalleenvio (CodigoEnvio, CodigoArticulo, CantidadEnviada) values(1,1,6);
Insert into detalleenvio (CodigoEnvio, CodigoArticulo, CantidadEnviada) values(2,1,3);

Insert into ordenesdeenvio (CodigoEnvio, CodigoCasamiento, FechaEnvio) values(1,3,curdate());
Insert into ordenesdeenvio (CodigoEnvio, CodigoCasamiento, FechaEnvio) values(2,2,curdate());

select* from ordenesdeenvio;

select distinct codigoarticulo from regalos where codigoarticulo not in (select codigoarticulo from detalleenvio);

select distinct regalos.codigoarticulo from regalos 
Join detalleenvio ON regalos.codigoarticulo <> detalleenvio.codigoarticulo;

-- 5.	¿Cuántas unidades de cada artículo se enviaron en esta semana? 	
select cantidadenviada from detalleenvio 
join ordenesdeenvio ON ordenesdeenvio.codigoenvio = detalleenvio.codigoenvio
where TIMESTAMPDIFF(Day,CURDATE(),fechaenvio) <= 7;

select * from novios where nombrenovio = 'Hernan';

select * from novios where nombrenovio Like '[Hh]ern[aá]n';
select * from novios where nombrenovio Like '[Jj]u[aá]n';

select codigoarticulo from articulos where precio between 100 and 1000;
select codigoarticulo from articulos where precio >= 100 and precio <= 1000;

UPDATE regalos set cantidadrequerida = 0 where codigocasamiento in (select codigocasamiento from casamiento where fecha < curdate() );

-- 10.	Listar los artículos cuya cantidad enviada por envío este mes es menor que 5.
select codigoarticulo from detalleenvio 
join ordenesdeenvio ON detalleenvio.codigoenvio = ordenesdeenvio.codigoenvio
where cantidadenviada < 5 and month(FechaEnvio) = month(curdate());

select a.codigoarticulo from regalos a
JOIN regalos b ON a.codigoarticulo = b.codigoarticulo
where a.codigocasamiento = 2 and b.codigocasamiento = 3;

select codigoarticulo from regalos where codigocasamiento = 2 and codigoarticulo IN (select codigoarticulo from regalos where codigocasamiento = 3);
select a.codigoarticulo from  (select codigoarticulo from regalos  where codigocasamiento = 3) a , (select codigoarticulo from regalos  where codigocasamiento = 2) b
where a.codigoarticulo = b.codigoarticulo;

/*
SELECT codigoarticulo FROM articulos WHERE codigoarticulo IN (SELECT Codigoarticulo FROM
Regalos group by CodigoArticulo HAVING COUNT(1) < 3 );

SELECT count(1) FROM
Regalos group by CodigoArticulo HAVING COUNT(1) >=3
*/
