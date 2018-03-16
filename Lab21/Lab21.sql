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


IF EXISTS(SELECT name FROM sysobjects WHERE name = 'modificarMaterial' AND type = 'P')
	Drop Procedure modificaMaterial

	GO
	CREATE PROCEDURE modificaMaterial
	@uclave NUMERIC (