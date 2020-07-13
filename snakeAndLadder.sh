#! /bin/bash
echo "==========Snake and Ladder=========="
START_POSITION=0;
END_POSITION=100;
DICE_COUNT=0;
function snakeAndLadder(){
	dieNumber=$((1+$(($RANDOM%6))))
	case $(($RANDOM%3)) in
		0) echo "No play($dieNumber)  	-	player position	-	$START_POSITION";;
		1) pointOfGame=$(($START_POSITION+$dieNumber));
			if [[	$pointOfGame -eq $END_POSITION ]]
			then
				echo "getLadder($dieNumber)   -  player position   -  $pointOfGame";
				echo "the player wins";
				echo "number of times the dice throws : $DICE_COUNT"
				exit;
			elif [[ $pointOfGame -lt $END_POSITION ]]
			then
				START_POSITION=$pointOfGame;
			fi
			echo "getLadder($dieNumber)	-	player position	-	$START_POSITION";
			echo "play again ";snakeAndLadder;;
		2)	if [[ $START_POSITION -ge $dieNumber ]]
			then
				START_POSITION=$(($START_POSITION-$dieNumber));
			fi
			echo "getSanke($dieNumber)	-	player position	-	$START_POSITION"
	esac
	((DICE_COUNT++))
}
while [ $START_POSITION -ne $END_POSITION ]
do
	snakeAndLadder
done
