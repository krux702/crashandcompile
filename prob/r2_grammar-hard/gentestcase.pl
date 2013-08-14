#!/usr/bin/perl

srand();
my $testcase = shift;
unless($testcase =~ /^\d+$/){
	print "USGE: ./gentestcase.pl <TESTCASE#>\n";
	exit;
}
my @grammars = ();

my %rules1 = qw(
S	aBa|bBb|cBc|g
B	bCb|cCc|dDd|f
C	a|b|c
D	d|a|e|E
E	hacker
);
push(@grammars,%rules1);
my %rules2 = qw(
S	aBa|bBb|cBc|dDd
B	b
C	aDDD|aDD|aDd|aDd|aDD
D	d|a|e|E
E	f
);
push(@grammars,%rules2);
if($testcase > 2){$testcase = 2;}
my %rules = $grammars[$testcase];

my $start = "S";
push(@toresolve,$start);
$complete = 0;
my @unique = ();
while($complete == 0){
	$complete = 1;
	my @newresolve = ();
	foreach my $toresolve (@toresolve){
		#print "Checking [$toresolve] for all lowercase...\n";
		if($toresolve =~ /^[a-z]+$/){
			#print "ADDING $toresolve to final strings list!\n";
			$unique{$toresolve} = 1;
			next;
		}
		#print "Resolving $toresolve...\n";
		my @subs = split(//,$toresolve);
		foreach my $sub (@subs){
			#print "\tChecking $sub...\n";
			foreach my $lrule (keys %rules){
				if($lrule eq $sub){
					#print "\t\t$sub matches rule: $lrule -> $rules{$lrule}\n";
					$complete = 0;
					my @rrules = split(/\|/,$rules{$lrule});
					foreach my $rrule (@rrules){
						#print "\t\t\tApplying rule $rrule...\n";
						my $tmp = $toresolve;
						$tmp =~ s/$sub/$rrule/;
						#print "\t\t\tPushing $tmp to new resolutions\n";
						push(@newresolve,$tmp);
					}
				}
			}
		}		
	}
	@toresolve = @newresolve;
}
my @yes = ();
open(OUTFILE,">all_strings-$testcase.txt");
foreach my $string (sort keys %unique){
	print OUTFILE "$string\n";
	print "$string\n";
	push(@yes,$string);
}
close OUTFILE;
open(FILE,">in$testcase");
my %rules = $grammars[$testcase];
foreach my $key (keys %rules){
	print "$key -> $rules{$key}\n";
}
my @terminals = ('a','b','c','d','e','f','g','hacker');
for(my $i = 0; $i < int(rand(10))+4; $i++){
	my $choice = int(rand(100)) % 2;
	if($choice == 1){
		my $string = $yes[int(rand(@yes))];
		print FILE "$string\n";
	} else {
		my $string = "";
		for(my $j = 0; $j < int(rand(3))+3; $j++){
			$string .= $terminals[int(rand(@terminals))];
		}
		print FILE "$string\n";
	}
}
close FILE;