#!/bin/bash
<<comment
To complete this project, you need to write a script that generates a random number between 1 and 1000 for users to guess. Create a number_guess database to hold the information suggested in the user stories. Connect to the interactive psql shell with psql --username=freecodecamp --dbname=postgres to create the database. In your script, you can create a PSQL variable for querying the database like this: PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c". Your script should only ask for input from the user to get the username and to take guesses. The tests will add users to your database when the script has that ability, feel free to delete those. Some script related user stories may not pass until the script is completely working. Don't forget to commit your work frequently.

Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql in a bash terminal (not the psql one). It will save the commands to rebuild your database in number_guess.sql. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering psql -U postgres < number_guess.sql in a terminal where the .sql file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the number_guess.sql file, as well as the final version of your number_guess.sh file, in a public repository and submit the URL to it on freeCodeCamp.org.
comment

#!/bin/bash

# variable to query database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# promp player for username
echo "Enter your username:"
read USERNAME

# generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# get username data
USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $USERNAME_RESULT ]] #its new
then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    SELECTED_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else #was before
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi




GUESSES=1
echo -e "\nGuess the secret number between 1 and 1000:"
read NUMBER_CHOOSEN

while true;
do
  if [[ ! $NUMBER_CHOOSEN =~ ^[0-9]+$ ]] #not number
  then
    echo -e "\nThat is not an integer, guess again:"
  else
    if [[ $NUMBER_CHOOSEN == $SECRET_NUMBER ]] 
    then
      break
    else
      if (($NUMBER_CHOOSEN > $SECRET_NUMBER))
      then
        echo -e "\nIt's lower than that, guess again:"
      else
        echo -e "\nIt's higher than that, guess again:"
      fi      
    fi 
  fi

  GUESSES=$((GUESSES + 1))
  read NUMBER_CHOOSEN
done


VAR= $($PSQL "INSERT INTO games(user_id,guesses) VALUES($USER_ID,$GUESSES);")
echo -e "\nYou guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"