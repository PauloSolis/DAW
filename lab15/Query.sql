SELECT * FROM Materiales

SELECT* FROM Materiales
WHERE clave=1000


SELECT clave, RFC, Fecha FROM Entregan

SELECT * FROM Materiales, Entregan
WHERE Materiales.clave = Entregan.clave

SELECT * FROM Entregan, Proyectos
WHERE Entregan.numero <= Proyectos.numero

(SELECT *FROM Entregan WHERE Clave= 1450)
UNION
 (SELECT* FROM Entregan WHERE Clave = 1300)

 SELECT*FROM 	Entregan WHERE Clave= 1450 or Clave = 1300


(SELECT Clave FROM Entregan WHERE numero=5001) 
intersect
(SELECT Clave FROM Entregan WHERE numero=5018)

(select * from entregan)
except
(select * from entregan where clave=1000) 

SELECT * FROM Entregan, Materiales

Set dateformat dmy
SELECT Descripcion, sum(Cantidad) as 'Total de Entregas'
FROM Entregan e, Materiales m
WHERE  m.Clave = e.Clave AND Fecha between '01/01/2000' AND '31/12/2000'
group by Descripcion 

Set dateformat dmy
SELECT distinct Descripcion, sum(Cantidad) as 'Total de Entregas'
FROM Entregan e, Materiales m
WHERE  m.Clave = e.Clave AND Fecha between '01/01/2000' AND '31/12/2000'
group by Descripcion


SELECT p.Numero, Denominacion, Fecha, Cantidad
FROM Proyectos p, Entregan e
WHERE p.Numero=e.Numero
order by Numero desc,Fecha desc

SELECT * 
FROM Materiales
WHERE Descripcion LIKE 'Si%' 


DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar; 

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%'

SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'

SELECT Numero FROM Entregan WHERE Numero LIKE '___6' 


SELECT RFC,Cantidad, Fecha,Numero 
FROM Entregan 
WHERE Numero Between 5000 and 5010 AND 
Exists ( SELECT RFC 
FROM Proveedores
WHERE RazonSocial LIKE 'La%' and Entregan.RFC = Proveedores.RFC) 


SELECT RFC,Cantidad, Fecha,Numero 
FROM Entregan 
WHERE Numero Between 5000 and 5010 AND 
RFC in ( SELECT RFC 
FROM Proveedores
WHERE RazonSocial LIKE 'La%' and Entregan.RFC = Proveedores.RFC)


SELECT RFC,Cantidad, Fecha,Numero 
FROM Entregan 
WHERE Numero Between 5000 and 5010 AND 
RFC not in ( SELECT RFC 
FROM Proveedores
WHERE RazonSocial not LIKE 'La%' and Entregan.RFC = Proveedores.RFC)




SELECT Cantidad, Numero
FROM Entregan 
WHERE Clave = some(
SELECT Clave
FROM  Entregan
WHERE  Clave = 1000 or clave = 1050)



SELECT TOP 2 * FROM Proyectos

SELECT TOP Numero FROM Proyectos 

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2)
UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000

SELECT * 
FROM Materiales


SELECT Descripcion, sum(e.cantidad)*costo*(PorcentajeImpuesto/1000) as 'Total'
FROM entregan e, Materiales m
WHERE e.clave = m.clave
group by costo, PorcentajeImpuesto, Descripcion
order by costo desc

create view Vista1
as (
SELECT m.clave, descripcion
FROM Materiales m, Proyectos p, entregan e
WHERE m.clave = e.clave and e.numero = p.numero 
and p.denominacion = 'Mexico sin ti no estamos completos'
)

SELECT * 
FROM Vista1

CREATE view Vista2
as (
SELECT m.clave, descripcion
FROM Materiales m, Proveedores p, entregan e
WHERE m.clave = e.clave and p.RFC = e.RFC 
and p.RazonSocial = 'Acme Tools'
)

SELECT * 
FROM Vista2


Set dateformat dmy
CREATE view Vista3
as (
	
	SELECT RFC
	FROM entregan
	WHERE Fecha between '01/01/2000' AND '31/12/2000'
	group by RFC
	having (sum(cantidad)/count(cantidad))>=300
)


SELECT *
FROM Vista3

Set dateformat dmy
CREATE view Vista4
as (
	
	SELECT TOP 1 Clave
	FROM Entregan
	WHERE Fecha between '01/01/2001' AND '31/12/2001'
	group by Clave
	
)

SELECT *
FROM Vista4

CREATE view Vista5
as (
	SELECT descripcion, sum(cantidad) as 'Total De Entregas'
	FROM Entregan e, Materiales m
	WHERE e.clave = m.clave and fecha between '01/01/2000' and '31/12/2000'
	Group by descripcion
	
)

SELECT *
FROM Vista5

CREATE view Vista6
as (
	SELECT descripcion
	FROM Materiales
	WHERE descripcion like '%ub%'
	
)
DROP view Vista6
SELECT *
FROM Vista6

CREATE view Vista7
as (
	SELECT Denominacion, sum(Cantidad*costo*(PorcentajeImpuesto/1000)) as 'Total a pagar'
	FROM Proyectos p, Materiales m, Entregan e
	WHERE m.clave = e.clave AND p.Numero=e.numero
	group by denominacion
	 
)
drop view Vista7
SELECT *
FROM Vista7

CREATE VIEW Televisa (denominacion, rfc, razonsocial) as
(
	select distinct pr.denominacion, p.rfc, p.RazonSocial
	from proveedores p, proyectos pr, entregan e
	where p.rfc = e.rfc AND pr.numero = e.numero AND pr.denominacion LIKE 'Televisa en acción'
)

CREATE VIEW Coahuila(denominacion, rfc, razonsocial) as
(
	select distinct pr.denominacion, p.rfc, p.RazonSocial
	from proveedores p, proyectos pr, entregan e
	where p.rfc = e.rfc AND pr.numero = e.numero AND pr.denominacion LIKE 'Educando en Coahuila'
)

CREATE VIEW Vista8 As
(
	select razonsocial from Televisa
	except
	select razonsocial from Coahuila
)

SELECT * 
FROM Vista8
create view Vista9 as(	

	SELECT m.Costo, m.Descripcion
	FROM Entregan e, proyectos p, Proveedores pr, materiales m
	WHERE p.numero=e.numero AND pr.RFC=e.RFC AND m.Clave = e.clave
	AND p.Denominacion='Televisa en acción'  AND pr.RFC  not in (
	SELECT pr.RFC
	FROM Entregan e, Proyectos p, Proveedores pr, Materiales m
	WHERE p.numero=e.numero AND pr.RFC=e.RFC AND m.Clave = e.clave AND p.Denominacion='Educando en Coahuila')

)

SELECT* 
FROM vista9

CREATE View Vista10
as(
	SELECT m.Costo, m.Descripcion
	FROM Entregan e, proyectos p, Proveedores pr, materiales m
	WHERE p.numero=e.numero and pr.RFC=e.RFC and m.Clave = e.clave
	AND p.Denominacion='Televisa en acción'  AND pr.RFC  in (
	SELECT pr.RFC
	FROM Entregan e, Proyectos p, Proveedores pr, Materiales m
	WHERE p.numero=e.numero AND pr.RFC=e.RFC AND m.Clave = e.clave AND p.Denominacion='Educando en Coahuila')

)


SELECT *
FROM Vista10