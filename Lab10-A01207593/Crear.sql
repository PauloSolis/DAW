Create table	Materiales(
	clave numeric(5),
	Descripci�n varchar(50),
	Costo numeric(8,2)
)

Create table Proveedores(
	RFC char(13),
	Raz�nSocial VARCHAR(50)	
)

create table Proyectos(
	Numero NUMERIC (5), 
	Denominaci�n VARCHAR (50)
	
)

create table Entregan(
	clave numeric(5),
	RFC char(13),
	Numero NUMERIC(5),
	Fecha DateTime,
	Cantidad numeric(8,2)


)

