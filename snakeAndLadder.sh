#! /bin/bash
echo "==========Snake and Ladder=========="
startPosition=0;
endPosition=100;
pointOfGame=$((1+$(($RANDOM%6))))
function snakeAndLadder(){
	case $(($RANDOM%3)) in
		0) echo "No Play"
			echo "player position	-	$startPosition";;
		1) echo "player get ladder";
			startPosition=$(($startPosition+$pointOfGame));
			echo "player position	-	$startPosition";;
		2)	echo "player get snake";
			if [[ $startPOsition -ge $pointOfGame ]]
			then
				startPosition=$(($startPosition-$pointOfGame));
			fi
			echo "player position	-	$startPosition"
	esac
}
snakeAndLadder
