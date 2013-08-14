## Crash and Compile

_"A programming contest crossed with a drinking game. What can possibly go wrong?"_

Crash And Compile is a ACM-style programming contest crossed with a drinking game,
where teams of two people try to solve as many programming problems as they can.
As teams compile and run their programs, each time their code fails to compile,
produces the incorrect output or segfaults, the team must drink. Meanwhile, our
lovely Team Distraction will be doing what they can to make the job of programming
while intoxicated all the more difficult and/or enjoyable. 

In previous years during this distinctive competition contestants have gone to such
lengths as to weld basket-ball sized metal dice to choose their programming language
by chance, have written their own language to solve the problems, and have chosen
such unorthadox development environments as the clearly superior palm pilot, to a
functioning robotic PDP-11/23 complete with antiquated green screen terminal... and
in the most audacious of cases, have won the competition without looking at the
screen.

Do you have what it takes to Crash And Compile?


## The Problems

The /prob directory has the problems we used during the DEF CON Crash and Compile
competition.


## Input and Output

All programs should read input on standard input, and produce output on standard output.
Your program will be run with its input and output redirected to files, and diff will be
used to compare your output with the correct answer.

A simple program that does this in C would be:

        #include <stdio.h>

        int main() {
           int i;
           while( scanf("%d", &i) ) {
              printf("%d\n", i);
           }
           return 0;
        }


This would then be compiled by the grader:

        gcc sample.c

And run with sample inputs (in1.txt) and outputs (out1.txt)

in1.txt:

        1
        2
        3

out1.txt:

        1
        2
        3

Invocation:

        ./a.out < in1.txt | diff -wBb - out1.txt

The return code from diff is then used to determine if your program has passed or failed.

