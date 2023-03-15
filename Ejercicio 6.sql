SELECT fp1.*
FROM pron�sticos_de_ventas p1
INNER JOIN (
  SELECT d�a, art�culo, local, MAX(fecha_pron�stico) AS max_fecha_pron�stico
  FROM pron�sticos_de_ventas
  WHERE fecha_pron�stico <= d�a
  GROUP BY d�a, art�culo, local
) fp2 ON fp1.d�a = fp2.d�a AND fp1.art�culo = fp2.art�culo AND fp1.local = fp2.local AND fp1.fecha_pron�stico = fp2.max_fecha_pron�stico