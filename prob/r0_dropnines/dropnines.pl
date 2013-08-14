#!/usr/bin/perl

while(<>){
	my $d = $_;
	chomp($d);
	if($d eq "#"){ exit; }
	my($sum,$result) = split(/\=/,$d);
	$sum =~ s/9//g;
	$sum =~ s/\+//g;
	my @sum = split(//,$sum);
	my @result = split(//,$result);
	my $rescheck = join("+",@result);
	my $sumcheck = join("+",@sum);
	my $dres = eval($rescheck);
	my $dsum = eval($sumcheck);
	if($dres eq $dsum){
		print "TRUE\n";
	} else {
		print "FALSE\n";
	}
	
	
}
