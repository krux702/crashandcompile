#!/usr/bin/perl

while(<>){
	my $line = $_;
	chomp($line);
	$line =~ s/ //g;
	my $length = length($line);
	if(($length % 3) == 0){
		print "YES\n";
	} else {
		print "NO\n";
	}
}	
