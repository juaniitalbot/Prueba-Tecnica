SELECT  v.dia, v.articulo, v.local, 
CASE 
	WHEN v.unidades_vendidas is null THEN 0
	ELSE v.unidades_vendidas
END AS unidades_vendidas,
CASE 
	WHEN s.unidades_stock is null THEN 0
	ELSE s.unidades_stock
END AS unidades_stock
FROM Ventas v
INNER JOIN Stock s ON v.articulo = s.articulo AND v.dia = s.dia AND v.local = s.local

