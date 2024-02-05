#! /bin/bash

#sql connection
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

#get services
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
echo "~~~~~ MY SALON ~~~~~"
echo "Welcome to My Salon, how can I help you?"

#check option
while true; do
    #MENU
    echo "$SERVICES" | while IFS='|' read SERVICE_ID SERVICE_NAME
    do
        echo "$SERVICE_ID) $SERVICE_NAME"
    done

    read SERVICE_ID_SELECTED

    ROW_SELECTED=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
    if [[ ! -z $ROW_SELECTED ]] 
    then
        break
    else
        echo "I could not find that service. What would you like today?"
    fi
done

#ask personal data
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
CUSTOMER_NAME=""
CUSTOMER_PHONE=""
SERVICE_TIME=""

echo  "What's your phone number?"

read CUSTOMER_PHONE

WAS_FOUND=$($PSQL "SELECT customer_id,name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

if [[ -z "$WAS_FOUND" ]]
then
    #add customer
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo $($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
    ID_CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
else
    IFS='|' read -r ID_CUSTOMER CUSTOMER_NAME _ <<< "$WAS_FOUND"
fi

#add appointment
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

texto_final="I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
echo $($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($ID_CUSTOMER,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
echo $texto_final