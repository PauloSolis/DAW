 SET DATEFORMAT dmy
BULK INSERT a1207593.a1207593.Entregan
   FROM 'e:\wwwroot\a1207593\Entregan.csv'
   WITH	
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
