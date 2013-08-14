<!-- RATING: HARD -->
<!-- NAME: Crash and Compile Teams -->
## Crash and Compile Teams

Each year we get more and more people trying to compete in Crash and Compile. 
The contest has become so popular that people have been joining multiple
teams in order to maximize their chances of getting on selected on one of the
final CNC teams.  We want as many people to be able to compete as possible of
course, but obviously the same person isn't able to be a member of multiple
teams.

Given a number of team submissions, determine the maximum number of teams
possible without having the same person on more than one team.

## INPUT

The first line will contain the number of teams who have entered, followed by
each of the teams.  A team can contain one or two people.  For this problem we
just list the people who joined each team, so "HAL 9000 & Stky Bit" is the same
as "Stky Bit & HAL 9000".


## The Output
List the total count of the number teams you can select from the given list and
not have a person listed one more than one team.  For example if you select
Flirzan & Punk to be on a team, no other team with either Flirzan or Punk as a
member would be eligible.  You may not mix and match members to create new teams, you may only select teams that have been applied for.


## Sample Input:

    10
    Flirzan & Punk
    Kaptcha & Stky Bit
    Flirzan & Grifter
    Steve
    Flirzan & Stky Bit
    Stky Bit & Jammer
    Punk & Grifter
    Grifter & Steve
    HAL 9000 & Stky Bit
    Grifter & Jammer
          
## Sample Output:

    4 Teams
