#!/bin/bash

# Definir la función en Python
procesar_frase() {
    frase="$1"
    python3 <<END
def procesar_frase(frase):
    # Dividir la frase en una lista de elementos por coma
    elementos = frase.split(',')

    # Lista para almacenar los elementos procesados
    elementos_procesados = []

    # Recorrer cada elemento
    for elemento in elementos:
        # Intentar convertir el elemento a un número
        try:
            # Si el elemento es un número, agregarlo a la lista tal como está
            elemento_procesado = int(elemento)
        except ValueError:
            # Si el elemento no es un número, agregarlo a la lista entre comillas simples
            elemento_procesado = "'" + elemento + "'"

        # Agregar el elemento procesado a la lista
        elementos_procesados.append(elemento_procesado)

    # Convertir la lista de elementos procesados nuevamente a una frase separada por comas
    frase_procesada = ','.join(map(str, elementos_procesados))

    return frase_procesada

# Llamar a la función con la frase proporcionada como argumento
frase = "$frase"
resultado = procesar_frase(frase)
print(resultado)  # Output esperado: 'Nombre','Habitant',17,23,18033989,16
END
}

# Función para insertar datos desde un archivo CSV a una tabla
PSQL="psql -X --username=freecodecamp --dbname=universe --no-align --tuples-only -c"
#echo $($PSQL "TRUNCATE galaxy, star, planet, moon, habitant")

PSQL_COMMAND="/usr/lib/postgresql/12/bin/psql"
PSQL_OPTIONS="-X --username=freecodecamp --dbname=universe --no-align --tuples-only"

PSQL="$PSQL_COMMAND $PSQL_OPTIONS"

insert_data_from_csv() {
    table_name="$1"
    csv_filename="$2"
    shift 2
    columns=("$@")

    #while IFS=',' "${columns[@]}"

    cat "$csv_filename" | while read -r line
    do
        columns_list=$(IFS=','; echo "${columns[*]}")
        values_list=$line
        resultado=$(procesar_frase "$line")
        #echo $line
        #echo $columns_list
        #echo $resultado
        
        if [[ "$line" != "$columns_list" ]];
        then
            echo "INSERT INTO $table_name(${columns_list}) VALUES(${resultado});"
            echo "INSERT INTO $table_name(${columns_list}) VALUES(${resultado});" | $PSQL
            #$($PSQL "INSERT INTO $table_name(${columns_list}) VALUES(${resultado});")
        fi
    done
}

# Insertar datos desde los archivos CSV

#insert_data_from_csv galaxy galaxy.csv name age_in_millions_years planets_number_in_billions stars_number_in_million
#insert_data_from_csv star star.csv name is_alive galaxy_id visible_from_earth
#insert_data_from_csv planet planet.csv name distance_from_earth_in_million_miles size has_life star_id
#insert_data_from_csv moon moon.csv name description planet_id was_visited_by_humans
#insert_data_from_csv habitant habitant.csv name age dni planet_id

echo "Los datos se han insertado en las tablas de la base de datos 'universe'."