<!-- RATING: EASY -->
<!-- NAME: BinHex Palindromes -->
##BinHex Palindromes

A palindrome is a word that reads the same forwards as backwards. For example,
DAD is a palindrome, while FATHER is not. A binhex palindrome is a number in
decimal representation whose binary and hexadecimal representations are both
palindromes. For example 9 is a binhex palindrome because 9 (the hexadeximal
representation of 9) is a palindrome, as is 1001 (the binary representation of
9). 


NOTE: The input number does not have to be a palindrome in decimal format. 9
is also a decbinhex palindrome because 9 (the decimal representation of 9) is
a palindrome on its own, but finding a non-single digit decbinhex palindrome
is hard.

##INPUT
Each input line contains an integer.
Assume that the integer is no longer than 15 digits.
End of data is indicated by '#' on a line by itself.

##The Output
Given an integer, decide whether it is a binhex palindrome or not.


##Sample Input
	9
	40
	1057
	2005
	2313
	#

##Sample Output
	9 is a binhex palindrome (1001,9)
	40 is NOT a binhex palindrome (101000,28)
	1057 is NOT a binhex palindrome (10000100001,421)
	2005 is NOT a binhex palindrome (11111010101,7d5)
	2313 is a binhex palindrome (100100001001,909)
