SELECT fp1.*
FROM pronósticos_de_ventas p1
INNER JOIN (
  SELECT día, artículo, local, MAX(fecha_pronóstico) AS max_fecha_pronóstico
  FROM pronósticos_de_ventas
  WHERE fecha_pronóstico <= día
  GROUP BY día, artículo, local
) fp2 ON fp1.día = fp2.día AND fp1.artículo = fp2.artículo AND fp1.local = fp2.local AND fp1.fecha_pronóstico = fp2.max_fecha_pronóstico