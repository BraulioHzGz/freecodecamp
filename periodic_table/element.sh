#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  STRING_LEN=${#1}
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    GET_ATOMIC_NUMBER=$1
    GET_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
    FORMATED_SYMBOL=$(echo $GET_SYMBOL | sed -r 's/^ *| *$//g')
    GET_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
    FORMATED_NAME=$(echo $GET_NAME | sed -r 's/^ *| *$//g')

  elif [[ $STRING_LEN -eq 1 || $STRING_LEN -eq 2 ]] # Verifico si solo son 1 o 2 letras (símbolos)
  then
    POSSIBLE_SYMBOL=$1
    GET_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$POSSIBLE_SYMBOL'")
    if [[ -z $GET_ATOMIC_NUMBER ]]
    then
      echo -e "I could not find that element in the database."
      exit
    else
      GET_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
      FORMATED_SYMBOL=$(echo $GET_SYMBOL | sed -r 's/^ *| *$//g')
      GET_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
      FORMATED_NAME=$(echo $GET_NAME | sed -r 's/^ *| *$//g')
    fi

  else  # Buscamos por nombre del elemento entonces
    POSSIBLE_NAME=$1
    GET_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$POSSIBLE_NAME'")
    if [[ -z $GET_ATOMIC_NUMBER ]]
    then
      echo -e "I could not find that element in the database."
      exit
    else
      GET_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
      FORMATED_SYMBOL=$(echo $GET_SYMBOL | sed -r 's/^ *| *$//g')
      GET_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
      FORMATED_NAME=$(echo $GET_NAME | sed -r 's/^ *| *$//g')
    fi
  fi

  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
  MELTING_P=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
  BOILING_P=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$GET_ATOMIC_NUMBER'")
  GET_TYPE=$($PSQL "SELECT DISTINCT(type) FROM types JOIN properties ON properties.type_id = types.type_id WHERE properties.atomic_number = '$GET_ATOMIC_NUMBER'")
  FORMATED_TYPE=$(echo $GET_TYPE | sed -r 's/^ *| *$//g')

  echo "The element with atomic number $GET_ATOMIC_NUMBER is $FORMATED_NAME ($FORMATED_SYMBOL). It's a $FORMATED_TYPE, with a mass of $ATOMIC_MASS amu. $FORMATED_NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius."
fi
