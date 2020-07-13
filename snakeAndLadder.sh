#! /bin/bash
echo "==========Snake and Ladder=========="
START_POSITION=0;
END_POSITION=100;
pointOfGame=$((1+$(($RANDOM%6))))
function snakeAndLadder(){
	case $(($RANDOM%3)) in
		0) echo "No Play"
			echo "player position	-	$START_POSITION";;
		1) echo "player get ladder";
			START_POSITION=$(($START_POSITION+$pointOfGame));
			echo "player position	-	$START_POSITION";;
		2)	echo "player get snake";
			if [[ $START_POSITION -ge $pointOfGame ]]
			then
				START_POSITION=$(($START_POSITION-$pointOfGame));
			fi
			echo "player position	-	$START_POSITION"
	esac
}
snakeAndLadder
