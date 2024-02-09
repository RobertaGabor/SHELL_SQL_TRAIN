#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

TEMP="$1" 
TEMP_SQL=""

ATOMIC_NUMBER=""
ELEMENT_NAME=""
ELEMENT_LETTER=""

ELEMENT_TYPE_NAME=""
ATOMIC_MAS=""
MELTING_POINT=""
BOILING_POINT=""



if [[ -z $TEMP ]]; #check empty
then
  echo "Please provide an element as an argument."
else
      #check if is number, if is a word, or if its 1/2 digits
    if [[ $TEMP =~ ^[0-9]+$ ]]; #number
    then
      TEMP_SQL=$($PSQL "SELECT * FROM elements WHERE atomic_number=$TEMP;")
    elif [[ ${#TEMP} -gt 2 ]]; #name
    then
      TEMP_SQL=$($PSQL "SELECT * FROM elements WHERE name='$TEMP';")
    else #letter
      TEMP_SQL=$($PSQL "SELECT * FROM elements WHERE symbol='$TEMP';")
    fi

  if [[ -z $TEMP_SQL ]];
  then
    echo "I could not find that element in the database."
  else
    while IFS='|' read -r AN EL EN; do
      ATOMIC_NUMBER=$AN
      ELEMENT_NAME=$EN
      ELEMENT_LETTER=$EL
    done <<< $TEMP_SQL

    TEMP_SQL=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")

    while IFS='|' read -r AN AM MP BP ETN; do
      ELEMENT_TYPE_NAME=$($PSQL "SELECT type FROM types WHERE type_id=$ETN;")
      ATOMIC_MAS=$AM
      MELTING_POINT=$MP
      BOILING_POINT=$BP
    done <<< $TEMP_SQL

    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_LETTER). It's a $ELEMENT_TYPE_NAME, with a mass of $ATOMIC_MAS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  
  fi
fi


