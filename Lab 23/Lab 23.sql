IF EXISTS (SELECT* FROM Clientes_Banca)
 DROP TABLE Clientes_Banca
CREATE TABLE Clientes_Banca (
    NoCuenta varchar(5),
    Nombre varchar(30),
    Saldo numeric(10,2),
	PRIMARY KEY (NoCuenta)

);

IF EXISTS (SELECT * FROM Tipos_Movimiento )
DROP TABLE Tipos_MOVIMIENTO
CREATE TABLE Tipos_Movimiento (
	
	ClaveM varchar(2),
	Descripcion varchar(30),
	PRIMARY KEY (ClaveM)

);

IF EXISTS (SELECT * FROM  Movimientos) 
DROP TABLE MOVIMIENTOS 

CREATE TABLE Movimientos(
	NoCuenta varchar(5),
	ClaveM varchar(2),
	Fecha datetime,
	Monto numeric(10,2),
	FOREIGN KEY (NoCuenta) REFERENCES Clientes_Banca(NoCuenta),
	FOREIGN KEY (ClaveM) REFERENCES Tipos_Movimiento(ClaveM)
	

);
select * FROM Movimientos

BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000)
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000)
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000)
COMMIT TRANSACTION PRUEBA1 

SELECT * FROM Clientes_Banca

BEGIN TRANSACTION PRUEBA3
INSERT INTO Tipos_Movimiento VALUES('A','Retiro Cajero Automatico')
INSERT INTO Tipos_Movimiento VALUES('B','Deposito Ventanilla')
COMMIT TRANSACTION PRUEBA3

SELECT * FROM Tipos_Movimiento

BEGIN TRANSACTION PRUEBA4
INSERT INTO Movimientos VALUES('001','A',GETDATE(),500)
UPDATE Clientes_Banca SET SALDO -= 500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4


BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000)
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000)
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000)


IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

SELECT * FROM Clientes_Banca
GO
 Create Procedure REGISTRAR_RETIRO_CAJERO 
 as
 Begin Transaction Pruebas510
 INSERT INTO Movimientos VALUES('001','A',GETDATE(),510)
UPDATE Clientes_Banca SET SALDO -= 510
WHERE NoCuenta='001'

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA510
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION Pruebas510
END
GO

GO
 Create Procedure REGISTRAR_DEPOSITO_VENTANILLA
 as
 Begin Transaction Pruebas510
 INSERT INTO Movimientos VALUES('001','B',GETDATE(),510)
UPDATE Clientes_Banca SET SALDO -= 510
WHERE NoCuenta='001'

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA510
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION Pruebas510
END
GO