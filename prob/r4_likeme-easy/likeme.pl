#!/usr/bin/perl

while(<>){
	my $line = $_;
	chomp($line);
	if($line =~ /h/i){
		print "YES\n";
	} else {
		print "NO\n";
	}
}	
