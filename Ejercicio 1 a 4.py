
import pandas as pd

#  Ejercicio 1

df = pd.read_csv ('datos_arts.csv')
print(df)

# Ejercicio 2

df = pd.read_csv ('datos_arts.csv')

articulos_por_fecha = df.groupby('fecha')['articulo'].nunique()
importes_por_fecha = df.groupby('fecha')['importe'].sum()
df_final = pd.DataFrame({'Cantidad_articulos': articulos_por_fecha, 'Total_importe': importes_por_fecha})

print(df_final)

# Ejercicio 3

df = pd.read_csv('datos_arts.csv')

df['SECTOR'] = df['grupo'].apply(lambda grp: 
    'NO COMESTIBLES' if grp == '15 LIMPIEZA DEL HOGAR' or grp == '18 PERFUMERIA' 
    else 'PERECEDEROS' if grp == '4 LACTEOS' or grp == '9 FIAMBRERIA'
    else grp)

print(df['SECTOR'])

# Ejercicio 4

df = pd.read_csv('datos_arts.csv')

df['SECTOR'] = df['grupo'].apply(lambda grp: 
    'NO COMESTIBLES' if grp == '15 LIMPIEZA DEL HOGAR' or grp == '18 PERFUMERIA' 
    else 'PERECEDEROS' if grp == '4 LACTEOS' or grp == '9 FIAMBRERIA'
    else grp
)

df['fecha'] = pd.to_datetime(df['fecha'],dayfirst=True)

resumen = pd.pivot_table(df, index='fecha', columns='SECTOR', values=['precio', 'importe'], aggfunc={'precio': 'mean', 'importe': 'sum'})

resumen.columns = [f"{sector} {tipo}" for tipo in ['promedio', 'sum_importe'] for sector in resumen.columns.levels[1]]

resumen = resumen.sort_index(axis=1, level=0)

resumen_mensual = resumen.resample('M').sum()

resumen_mensual.index = resumen_mensual.index.strftime('%b-%y')

print(resumen_mensual)