#!/usr/bin/perl


my @totest = ();
my %rules = ();
while(<>){
	my $line = $_;
	chomp($line);
	if($line eq "#"){ last; }
	if($line =~ /->/){
		my ($left,$right) = split(/ -> /,$line);
		$rules{$left} = $right;
	} else {
		push(@totest,$line);
	}
}

my $start = "S";
push(@toresolve,$start);
$complete = 0;
my @unique = ();
print "GENERATING!\n";
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
print "VALID:\n";
foreach my $valid (keys %unique){
	print "$valid\n";
}
print "\n\n";
foreach my $test (@totest){	
	if($unique{$test} ne ""){
		print "YES\n";
	} else {
		print "NO\n";
	}
}
