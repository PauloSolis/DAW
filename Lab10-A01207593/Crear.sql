Create table	Materiales(
	clave numeric(5),
	Descripción varchar(50),
	Costo numeric(8,2)
)

Create table Proveedores(
	RFC char(13),
	RazónSocial VARCHAR(50)	
)

create table Proyectos(
	Numero NUMERIC (5), 
	Denominación VARCHAR (50)
	
)

create table Entregan(
	clave numeric(5),
	RFC char(13),
	Numero NUMERIC(5),
	Fecha DateTime,
	Cantidad numeric(8,2)


)

