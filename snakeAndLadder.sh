#! /bin/bash
echo "==========Snake and Ladder=========="
startPosition=0;
endPosition=100;
function snakeAndLadder(){
	while [ $startPosition -ne $endPosition ]
	do
	dieNumber=$((1+$(($RANDOM%6))))
	case $(($RANDOM%3)) in
		0) echo "No play($dieNumber)  	-	player position	-	$startPosition";;
		1) pointOfGame=$(($startPosition+$dieNumber));
			if [[	$pointOfGame -eq $endPosition ]]
			then
				echo "getLadder($dieNumber)   -  player position   -  $pointOfGame";
				echo "the player wins";exit;
			elif [[ $pointOfGame -lt $endPosition ]]
			then
				startPosition=$pointOfGame;
			fi
			echo "getLadder($dieNumber)	-	player position	-	$startPosition";;
		2)	if [[ $startPosition -ge $dieNumber ]]
			then
				startPosition=$(($startPosition-$dieNumber));
			fi
			echo "getSanke($dieNumber)	-	player position	-	$startPosition"
	esac
	done
}
snakeAndLadder
