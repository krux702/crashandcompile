#!/usr/bin/perl

while(<>){
	my $line = $_;
	chomp($line);
	$line =~ s/[\.\!\?]//g;
	my $linec = $line;
	my $linev = $line;
	$linec =~ s/[aeiouy]//g;
	$linev =~ s/[bcdfghjklmnpqrstvwxz]//g;
	$linec =~ s/ //g;
	$linev =~ s/ //g;
	my $concnt = length $linec;
	my $vowcnt = length $linev;
	if($concnt < $vowcnt){
		print "YES\n";
	} else {
		print "NO\n";
	}
}	
