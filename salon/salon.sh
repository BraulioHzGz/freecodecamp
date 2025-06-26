#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){

  echo -e "Welcome to My Salon, how can I help you?"
  echo -e "\n1) Hair cut\n2) Hair dye\n3) Hair extensions\n4) Makeup\n5) Paint nails\n6) Trim"
  read SERVICE_ID_SELECTED

  # Las variables tienen alcance GLOBAL a menos que lo ponga LOCAL

  case $SERVICE_ID_SELECTED in
    1) MAKE_RESERVATION ;;
    2) MAKE_RESERVATION ;;
    3) MAKE_RESERVATION ;;
    4) MAKE_RESERVATION ;;
    5) MAKE_RESERVATION ;;
    6) MAKE_RESERVATION ;;
    *) MAIN_MENU ;;
  esac
}

MAKE_RESERVATION(){
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  SERVICE_NAME_FORMATED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $GET_CUSTOMER_ID ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    
    if [[ -z $CUSTOMER_NAME ]]
    then
      MAIN_MENU "Please, enter a valid name"
    else
      INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
  fi

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$GET_CUSTOMER_ID'")
  CUSTOMER_NAME_FORMATED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
  echo -e "\nWhat time would you like your $SERVICE_ID_SELECTED, $CUSTOMER_NAME_FORMATED?"
  read SERVICE_TIME

  if [[ -z $SERVICE_TIME ]]
  then
    MAIN_MENU "Enter a valid time to make an appointment"
  else
    SERVICE_TIME_FORMATED=$(echo $SERVICE_TIME | sed -r 's/^ *| *$//g')
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($GET_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME_FORMATED')")
    echo "I have put you down for a $SERVICE_NAME_FORMATED at $SERVICE_TIME_FORMATED, $CUSTOMER_NAME_FORMATED."
    exit 0
  fi
}

MAIN_MENU
