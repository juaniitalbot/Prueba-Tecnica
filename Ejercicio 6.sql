SELECT fp1.*
FROM pronosticos_de_ventas p1
INNER JOIN (
  SELECT dia, articulo, local, MAX(fecha_pronostico) AS max_fecha_pronostico
  FROM pronosticos_de_ventas
  WHERE fecha_pronostico <= dia
  GROUP BY dia, articulo, local
) fp2 ON fp1.dia = fp2.dia AND fp1.articulo = fp2.articulo AND fp1.local = fp2.local AND fp1.fecha_pronostico = fp2.max_fecha_pronostico