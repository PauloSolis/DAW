 INSERT INTO Materiales values(1000, 'xxx', 1000) 

Delete from Materiales where Clave = 1000 and Costo = 1000 


ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC) 
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)  


INSERT INTO Materiales values(1000, 'xxx', 1000) 