#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(($RANDOM%1000+1)) # Generamos un número aleatorio entre 1 y 1000
BEST_GAME=1

echo "Enter your username:"
read USERNAME

GET_USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'" | xargs)

if [[ -z $GET_USERNAME_ID ]]
then
  ADD_USERNAME=$($PSQL "INSERT INTO users(username, games_played, best_guess) VALUES('$USERNAME', 0, 0)")
  GET_USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'" | xargs)
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GET_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = '$GET_USERNAME_ID'" | xargs)
  GET_BEST_GAME=$($PSQL "SELECT best_guess FROM users WHERE user_id = '$GET_USERNAME_ID'" | xargs)
  echo Welcome back, $USERNAME\! You have played $GET_GAMES_PLAYED games, and your best game took $GET_BEST_GAME guesses.
fi


echo "Guess the secret number between 1 and 1000:"


GUESS_FUNCTION(){
  if [[ $1 ]]
  then
    echo "$1"
  fi
  read NUMBER

  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    GUESS_FUNCTION "That is not an integer, guess again:"
  else
    if [[ $NUMBER -gt $RANDOM_NUMBER ]]
    then
      BEST_GAME=$((BEST_GAME+1))
      GUESS_FUNCTION "It's lower than that, guess again:"
    elif [[ $NUMBER -lt $RANDOM_NUMBER ]]
    then
      BEST_GAME=$((BEST_GAME+1))
      GUESS_FUNCTION "It's higher than that, guess again:"
    elif [[ $NUMBER -eq $RANDOM_NUMBER ]]
    then
      FINISH_FUNCTION 
    fi
  fi
}


FINISH_FUNCTION(){
  GET_GAMES_PLAYED=$((GET_GAMES_PLAYED+1))
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = '$GET_GAMES_PLAYED' WHERE user_id = '$GET_USERNAME_ID'")
  if [[ $GET_BEST_GAME -lt $BEST_GAME ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_guess = '$BEST_GAME' WHERE user_id = '$GET_USERNAME_ID'")
  fi
  echo "You guessed it in $BEST_GAME tries. The secret number was $RANDOM_NUMBER. Nice job!"
  exit
}

GUESS_FUNCTION
