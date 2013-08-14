<!-- RATING: EASY -->
<!-- NAME: WUMPUS EASY -->
##Wumpus

Ahhh, the classic Wumpus world. Treasure, dangerous mythical beasts, and artificial intelligence.
Let's start simple and pretend we're debugging.
Tell me if the directions make you go off the map.


##INPUT
Each input file will contain a 10X10 grid of characters. This grid will indicate your starting location as an S
All other spaces will be represented by a _ character. All lines after the grid will indicate directions: N, E, S, or W.
If at ANY point you leave the grid, print YES.
If you stay within the boundary for all moves, print NO.

##The Output
Print out either YES or NO 

##Sample Input 1
	__________
	__________
	__________
	__________
	__________
	__________
	__________
	__________
	______S___
	__________
	N
	N
	N
## Sample Output 1
	NO

##Sample Input 2
	__________
	__________
	__________
	__________
	__________
	__________
	__________
	__________
	______S___
	__________
	E
	E
	E
	E
	E
## Sample Output 2
	YES
