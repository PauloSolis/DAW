BULK INSERT a1207593.a1207593.Proveedores
   FROM 'e:\wwwroot\a1207593\proveedores.csv'
   WITH	
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  