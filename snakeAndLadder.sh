#! /bin/bash
echo "==========Snake and Ladder=========="
START_POSITION=0;
END_POSITION=100;
function ladder(){
   pointOfGame=$(($1+$2));
   if [[ $pointOfGame -eq $END_POSITION ]]
   then
      START_POSITION=$pointOfGame;
   elif [[ $pointOfGame -lt $END_POSITION ]]
   then
      START_POSITION=$pointOfGame;
      snakeAndLadder $START_POSITION
   else
      START_POSITION=$1;
      snakeAndLadder $START_POSITION
   fi
}
function snake(){
   if [[ $1 -ge $2 ]]
   then
      START_POSITION=$(($1-$2));
   else
      START_POSITION=$1
   fi
}
function snakeAndLadder(){
   dieNumber=$((1+$(($RANDOM%6))))
   case $(($RANDOM%3)) in
      0) START_POSITION=$1;;
      1) ladder $1 $dieNumber;;
      2) snake $1 $dieNumber;;
   esac
}
function game(){
   player1=0;player2=0;count=0;
   while [[ $player1 -ne $END_POSITION && $player2 -ne $END_POSITION ]]
   do
      if [[ $(($count%2)) -eq 0 ]]
      then
         snakeAndLadder $player1
         player1=$START_POSITION;
      else
         snakeAndLadder $player2
         player2=$START_POSITION;
      fi
      echo "player1: $player1    player2: $player2"
      ((count++))
   done
  }
game
