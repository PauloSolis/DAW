SELECT * from Materiales


SELECT * from Proveedores

SELECT * from Proyectos

SELECT * from Entregan

INSERT INTO Entregan values (0, 'xxx', 0, '1-jan-02', 0) 

Delete from Entregan where Clave = 0

ALTER TABLE Entregan add constraint cfentreganclave  foreign key (Clave) references Materiales (Clave)
ALTER TABLE Entregan add constraint RFCfentregancRFC  foreign key (RFC) references Proveedores(RFC)
ALTER TABLE Entregan add constraint Numfentreganclave  foreign key (Numero) references Proyectos(Numero)

sp_helpconstraint Entregan
sp_helpconstraint Proveedores
sp_helpconstraint Proyectos
sp_helpconstraint materiales



-- Ejercicio 4

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0)
Delete from Entregan where Cantidad = 0
ALTER TABLE entregan add constraint cantidad check (cantidad>0)
