BULK INSERT a1207593.a1207593.Materiales
   FROM 'e:\wwwroot\a1207593\materiales.csv'
   WITH	
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  sp_help materiales
	