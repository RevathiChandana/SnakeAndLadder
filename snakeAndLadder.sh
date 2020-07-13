#! /bin/bash
echo "==========Snake and Ladder=========="
START_POSITION=0;
END_POSITION=100;
NUM_PLAYERS=2
function snakeAndLadder(){
	dieNumber=$((1+$(($RANDOM%6))))
	case $(($RANDOM%3)) in
		0) echo "No play($dieNumber)	-	player$player position	-	$START_POSITION";;
		1) pointOfGame=$(($START_POSITION+$dieNumber));
			if [[	$pointOfGame -eq $END_POSITION ]]
			then
				echo "getLadder($dieNumber)	-	player$player position   -  $pointOfGame";
				START_POSITION=$pointOfGame;
			elif [[ $pointOfGame -lt $END_POSITION ]]
			then
				START_POSITION=$pointOfGame;
				echo "getLadder($dieNumber)	-	player$player position	-	$START_POSITION";
				echo "play again ";
				snakeAndLadder
			fi;;
		2)	if [[ $START_POSITION -ge $dieNumber ]]
			then
				START_POSITION=$(($START_POSITION-$dieNumber));
				echo "getSanke($dieNumber)	-	player$player position	-	$START_POSITION"
			fi
	esac
	((DICE_COUNT++))
}
for ((player=1;player<=NUM_PLAYERS;player++))
do
	DICE_COUNT=0;
	START_POSITION=0;
	while [[ $START_POSITION -ne $END_POSITION ]]
	do
			snakeAndLadder;
	done
	echo "number of times the player$player dice throws : $DICE_COUNT"
	array[$player]=$DICE_COUNT;
done
echo "number of times player1 and player2 throws dice : ${array[@]}"
if [[ ${array[1]} -gt ${array[2]} ]]
then
	echo "player2 won the game"
else
	echo "player1 won the game"
fi

