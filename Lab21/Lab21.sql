IF EXISTS (SELECT name FROM sysobjects
	Where name= 'creaMaterial' AND type= 'P' )
	DROP PROCEDURE CreaMaterial
GO

Create PROCEDURE creaMaterial
	@uclave Numeric(5,0),
	@udescripcion VARCHAR(50), 
	@ucosto NUMERIC (8,2),
	@uimpuesto NUMERIC (6,2)
AS
	INSERT INTO Materiales Values(@uclave, @udescripcion, @uclave, @uimpuesto)

Go


EXECUTE creaMaterial 5000,'Martillos Acme',250,15

SELECT * 
FROM Materiales


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'modificaMaterial' AND type = 'P')
	Drop Procedure modificaMaterial

	GO
	CREATE PROCEDURE modificaMaterial
	            @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
			UPDATE Materiales
			set Descripcion = @udescripcion,  Costo= @ucosto, PorcentajeImpuesto= @uimpuesto
            WHERE clave =(@uclave)
            GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'eliminaMaterial' AND type = 'P')
	Drop Procedure eliminaMaterial

	GO
	CREATE PROCEDURE eliminaMaterial
	            @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
			Delete FROM Materiales
            WHERE clave =(@uclave);
            GO

select* FROM Proyectos


IF EXISTS (SELECT name FROM sysobjects
	Where name= 'creaProyecto' AND type= 'P' )
	DROP PROCEDURE CreaProyecto
GO

Create PROCEDURE creaProyecto
	@unumero Numeric(5,0),
	@udenominacion VARCHAR(50)
	
AS
	INSERT INTO Proyectos Values(@unumero, @udenominacion)

Go




IF EXISTS(SELECT name FROM sysobjects WHERE name = 'modificaProyecto' AND type = 'P')
	Drop Procedure modificaProyecto

	GO
	CREATE PROCEDURE modificaProyecto
	           @unumero Numeric(5,0),
				@udenominacion VARCHAR(50)
            AS
			UPDATE Proyectos
			set   Denominacion= @udenominacion
            WHERE Numero = @unumero
            GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'eliminaProyecto' AND type = 'P')
	Drop Procedure eliminaProyecto

	GO
	CREATE PROCEDURE eliminaProyecto
	           @unumero Numeric(5,0),
				@udenominacion VARCHAR(50)
            AS
			Delete FROM Proyectos
            WHERE numero =(@unumero)
            GO


			select*From Proveedores
IF EXISTS (SELECT name FROM sysobjects
	Where name= 'creaProveedores' AND type= 'P' )
	DROP PROCEDURE creaProveedores
GO

Create PROCEDURE creaProveedores
	@uRFC CHAR(13),
	@uRazonSocial VARCHAR(50)
	
AS
	INSERT INTO Proveedores Values(@uRFC, @uRazonSocial)

Go


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'modificaProveedor' AND type = 'P')
	Drop Procedure modificaProveedor

	GO
	CREATE PROCEDURE modificaProveedor
	    @uRFC CHAR(13),
		@uRazonSocial VARCHAR(50)
	
AS
	UPDATE Proveedores
		set   RazonSocial= @uRazonSocial
        WHERE RFC=@uRFC
            
Go


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'eliminaProveedor' AND type = 'P')
	Drop Procedure eliminaProveedor

	GO
	CREATE PROCEDURE eliminaProveedor
	       @uRFC CHAR(13),
			@uRazonSocial VARCHAR(50)
 AS
			Delete FROM Proveedores
            WHERE RFC =(@uRFC)
     GO


	IF EXISTS (SELECT name FROM sysobjects
	Where name= 'creaEntregan' AND type= 'P' )
	DROP PROCEDURE creaEntregan
GO

Create PROCEDURE creaEntregan
	@uclave Numeric(5,0),
	@uRFC CHAR(13), 
	@unumero NUMERIC (5,0),
	@ufecha datetime,
	@ucantidad numeric(8,2)

	
AS
	INSERT INTO Entregan Values(@uclave, @uRFC,@unumero, @ufecha, @ucantidad )

Go


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'modificaEntregan' AND type = 'P')
	Drop Procedure modificaEntregan

	GO
	CREATE PROCEDURE modificaEntregan
		@uclave Numeric(5,0),
		@uRFC CHAR(13), 
		@unumero NUMERIC (5,0),
		@ufecha datetime,
		@ucantidad numeric(8,2)
	
AS
	UPDATE Entregan
		set   Cantidad = @ucantidad
        WHERE Clave= @uclave
            
Go


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'eliminaProveedor' AND type = 'P')
	Drop Procedure eliminaProveedor

	GO
	CREATE PROCEDURE eliminaProveedor
	     @uclave Numeric(5,0),
		@uRFC CHAR(13), 
		@unumero NUMERIC (5,0),
		@ufecha datetime,
		@ucantidad numeric(8,2)
	
 AS
	Delete FROM Entregan
        WHERE Clave = @uclave
     GO

 IF EXISTS (SELECT name FROM sysobjects 
                                WHERE name = 'queryMaterial' AND type = 'P')
                                DROP PROCEDURE queryMaterial
                            GO
                            
                            CREATE PROCEDURE queryMaterial
                                @udescripcion VARCHAR(50),
                                @ucosto NUMERIC(8,2)
                            
                            AS
                                SELECT * FROM Materiales WHERE descripcion 
                                LIKE '%'+@udescripcion+'%' AND costo > @ucosto 
                            GO
                            