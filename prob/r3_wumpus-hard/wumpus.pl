#!/usr/bin/perl

my $cnt = 0;
my @directions = ();
my $tx = 0;
my $ty = 0;
my $bx = 0;
my $by = 0;
my $sx = 0;
my $sy = 0;
my @grid = ();
my $test = shift;
#open(INFILE,"inputs/in$test");
while(<>){
	my $line = $_;
	chomp($line);
	if($cnt < 10){
		my @line = split(//,$line);
		my $sub = 0;
		foreach my $lineref (@line){
			$grid[$cnt][$sub] = $lineref;
			if($lineref eq "S"){
				$sx = $sub;
				$sy = $cnt;
			} elsif($lineref eq "B"){
				$bx = $sub;
				$by = $cnt;
			} elsif($lineref eq "T"){
				$tx = $sub;
				$ty = $cnt;
			}
			$sub++;
		}
	} else {
		push(@directions,$line);
	}
	$cnt++;
}	
for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
#		print $grid[$i][$j];
	}
#	print "\n";
}
#print @directions;
#print "\n\nCURRENT LOCATION: grid[$sy][$sx]\n";
foreach my $direction (@directions){
	chomp($direction);
	#my $s = <STDIN>;
	#print "\n$direction\n";
	my ($direction1,$direction2) = split(/ /,$direction);
	#print "You move $direction1...\n";

	if($direction1 eq "N"){
		$sy -= 1;
		if($sy < 0){ $sy = 9; }
	} elsif($direction1 eq "S"){
		$sy += 1;
		if($sy > 9){ $sy = 0; }
	} elsif($direction1 eq "E"){
		$sx += 1;
		if($sx > 9){ $sx = 0; }
	} else {
		$sx -= 1;
		if($sx < 0){ $sx = 9; }
	}
	#print "NEW LOCATION: grid[$sy][$sx]\n";
	if(($sx == $bx)&&($sy == $by)){
		print "DEATH\n";
		last;
	}
#	print "\n";
#	for(my $i = 0; $i < 10; $i++){
#        	for(my $j = 0; $j < 10; $j++){
#	        	if(($i == $sy)&&($j == $sx)){
#                        	print "X";
#                	} elsif(($i == $by)&&($j == $bx)){
#                        	print "Y";
#			} else {
#                	       print $grid[$i][$j];
#        	       }
#        	}
#        	print "\n";
#	}

	#print "Wumpus moves $direction2...\n";
	if($direction2 eq "N"){
		$by -= 1;
		if($by < 0){ $by = 9; }
	} elsif($direction2 eq "S"){
		$by += 1;
		if($by > 9){ $by = 0; }
	} elsif($direction2 eq "E"){
		$bx += 1;
		if($bx > 9){ $bx = 0; }
	} else {
		$bx -= 1;
		if($bx < 0){ $bx = 9; }
	}
	#print "NEW LOCATION: grid[$sy][$sx]\n";
	if(($sx == $bx)&&($sy == $by)){
		print "DEATH\n";
		last;
	}
	if(($sx == $tx)&&($sy == $ty)){
		print "TREASURE\n";
		last;
	}
#	print "\n";
#	for(my $i = 0; $i < 10; $i++){
#        	for(my $j = 0; $j < 10; $j++){
#	        	if(($i == $sy)&&($j == $sx)){
#                        	print "X";
#                	} elsif(($i == $by)&&($j == $bx)){
#                        	print "Y";
#			} else {
#                	       print $grid[$i][$j];
#        	       }
#        	}
#        	print "\n";
#	}

}
unless((($sx == $bx)&&($sy == $by))||(($sx == $tx)&&($sy == $ty))){
	print "NOTHING\n";
}
for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
		if(($i == $sy)&&($j == $sx)){
			#print "X";
		} else {
			#print $grid[$i][$j];
		}
	}
	#print "\n";
}
