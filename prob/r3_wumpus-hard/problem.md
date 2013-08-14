<!-- RATING: HARD -->
<!-- NAME: WUMPUS HARD -->
##Wumpus

Ahhh, the classic Wumpus world. Treasure, dangerous mythical beasts, and artificial intelligence.
But now...the wumpus moves as well.
Can you follow directions?

##INPUT
Each input file will contain a 10X10 grid of characters. 
This grid will indicate your starting location as an S, the location of a treasure as a T, and the location of an adventurer devouring beast as a B. 
All other spaces will be represented by a _ character. 
All lines after the grid will indicate two sets of directions seperated by a space. Directions are N, E, S, or W.
The first direction is for your character, the second is for the wumpus.
If at ANY point you enter the grid location with the monster, you die.
We will give you the benefit of the doubt, and say that YOU move BEFORE the wumpus moves.
Sorry, if both you and the wumpus reach the treasure, you die.
If at ANY point you enter the grid location with the treasure, you win.
Your job is to print out if you have found: TREASURE, DEATH, or NOTHING.

In classic RPG style, if you or the wumpus go off the grid in one direction, you end up back on the grid on the other side. 
So go N from the top of the grid, and you will be at the bottom of the grid.

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
	S N
	S N
	S N
## Sample Output
	NOTHING
