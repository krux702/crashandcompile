#!C:\strawberry\perl\bin\perl

my $test = shift;
unless($test =~ /^\d+$/){
	print "USAGE: ./gentestcase.pl <TESTCASE#>\n";
	exit;
}
my @things = qw(
Roses
Hackers
PIZZA
J._Edgar_Hoover
Exploring
Jumping
Distances
anywhere
ape
applaud
arm
artist
attack
attic
auto
avoid
awesome
awful
awning
babble
baby
baffle
bald
ballplayer
bark
base
baseball
basin
basketball
batch
bath
battle
beach
bead
beam
bean
beanstalk
beast
beat
bedtime
bee
beef
beehive
beet
begging
Crypto
DEFCON
Hacking
Hacking_things
Musical_Madness
Differential_equations
Music
plow
plums
pork
prance
pray
prayer
present
prim
prince
probe
prod
program
proud
prowl
PunkAB
Krux
Fish
Treacherous_Leachers
before
follow
around
another
because
different
picture
change
animal
letter
mother
answer
should
);
open(FILE,">inputs/in$test");
for($i = 0; $i < int(rand(10)) + 3; $i++){
	my $select = $things[int(rand(@things))];
	$select =~ s/_/ /g;
	print FILE "$select\n";
}
	
