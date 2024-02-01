#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
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


# Definir la función en Python
procesar_titulo() {
    frase="$1"
    parte_a_reemplazar="$2"
    nuevo_texto="$3"
    python3 <<END
def procesar_titulo(frase, parte_a_reemplazar, nuevo_texto):
    # Reemplazar la parte especificada de la frase con el nuevo texto
    frase_procesada = frase.replace(parte_a_reemplazar, nuevo_texto)
    return frase_procesada

# Llamar a la función con la frase proporcionada como argumento
frase = "$frase"
parte_a_reemplazar = "$parte_a_reemplazar"
nuevo_texto = "$nuevo_texto"
resultado = procesar_titulo(frase, parte_a_reemplazar, nuevo_texto)
print(resultado)
END
}

# Definir la función en Python
verificar_y_agregar() {
    texto1="$1"
    texto2="$2"
    python3 <<END
def verificar_y_agregar(texto1, texto2):
    if texto1.strip() == "":
        return "('" + texto2 + "')"
    elif texto2 not in texto1:
        return texto1 + ",('" + texto2 + "')"
    else:
        return texto1

# Llamar a la función con los textos proporcionados como argumentos
texto1 = "$texto1"
texto2 = "$texto2"
resultado = verificar_y_agregar(texto1, texto2)
print(resultado)
END
}


# Definir la función en Python
obtener_palabra_por_columna() {
    frase="$1"
    columna="$2"
    python3 <<END
def obtener_palabra_por_columna(frase, columna):
    palabras = frase.split(',')
    if columna < 1 or columna > len(palabras):
        print("Columna inválida")
    else:
        return palabras[columna - 1]

# Llamar a la función con los textos proporcionados como argumentos
frase = "$frase"
columna = $columna
resultado=obtener_palabra_por_columna(frase, columna)
print(resultado)
END
}





echo $($PSQL "TRUNCATE games,teams")


insert_data_from_csv() {
    table_name="$1"
    csv_filename="$2"
    shift 2
    columns=("$@")
    first_round=1
    #while IFS=',' "${columns[@]}"

    while IFS=',' read -r line
    do
        if [[ $first_round != 1 ]]
        then
            columns_list=$(IFS=','; echo "${columns[*]}")
            columns_list=$(procesar_titulo "$columns_list" ",winner," ",winner_id,")
            columns_list=$(procesar_titulo "$columns_list" ",opponent," ",opponent_id,")

            #echo $columns_list
            #echo $line

            
            winner_get_id=$(obtener_palabra_por_columna "$line" 3)
            opponent_get_id=$(obtener_palabra_por_columna "$line" 4)

            #echo $winner_get_id
            #echo $opponent_get_id

            winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner_get_id';")
            opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent_get_id';")
            
            #echo $winner_id
            #echo $opponent_id

            resultado_id=$(procesar_titulo "$line" ",$winner_get_id," ",$winner_id,")
            resultado_id=$(procesar_titulo "$resultado_id" ",$opponent_get_id," ",$opponent_id,")

            resultado=$(procesar_frase "$resultado_id")
            #echo $resultado
            

            output=$($PSQL "INSERT INTO $table_name(${columns_list}) VALUES(${resultado});")
            echo $output
        fi
        first_round=0
    done < "$csv_filename"
}


get_data_from_csv() {
    table_name="$1"
    csv_filename="$2"
    shift 2
    columns=("$@")
    resultado=""

    #while IFS=',' "${columns[@]}"

    while IFS=',' read -r line
    do
        columns_list=$(IFS=','; echo "${columns[*]}")
        values_list=$line

        
        #echo $line
        #echo $columns_list
        #echo $resultado
        
        if [[ "$line" != "$columns_list" ]];
        then
            winner=$(obtener_palabra_por_columna "$line" 3)
            opponent=$(obtener_palabra_por_columna "$line" 4)
            resultado=$(verificar_y_agregar "$resultado" "$winner") #winner
            resultado=$(verificar_y_agregar "$resultado" "$opponent") #opponent    
        fi
    done  < "$csv_filename"

    echo "INSERT INTO $table_name(name) VALUES ${resultado};"
    output=$($PSQL "INSERT INTO $table_name(name) VALUES ${resultado};") 
    echo output
}




# Insertar datos desde los archivos CSV
get_data_from_csv teams games.csv year round winner opponent winner_goals opponent_goals
insert_data_from_csv games games.csv year round winner opponent winner_goals opponent_goals
