<!-- RATING: MEDIUM -->
<!-- NAME: WUMPUS MEDIUM -->
##Wumpus

Ahhh, the classic Wumpus world. Treasure, dangerous mythical beasts, and artificial intelligence.
Can you follow directions?

##INPUT
Each input file will contain a 10X10 grid of characters. This grid will indicate your starting location as an S, the location of a treasure as a T, and the location of an adventurer devouring beast as a B. All other spaces will be represented by a _ character. All lines after the grid will indicate directions: N, E, S, or W.
If at ANY point you enter the grid location with the monster, you die.
If at ANY point you enter the grid location with the treasure, you win.
Your job is to print out if you have found: TREASURE, DEATH, or NOTHING.

In classic RPG style, if you go off the grid in one direction, you end up back on the grid on the other side. So go N from the top of the grid, and you will be at the bottom of the grid.

##The Output
Print out either TREASURE, DEATH, or NOTHING

##Sample Input
	__________
	___B______
	__________
	__________
	__________
	__________
	T_________
	__________
	______S___
	__________
	N
	N
	N
	N
	N
	N
	N
	W
	W
	W
	W
	W
	W
	W
## Sample Output
	DEATH
