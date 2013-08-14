#!/usr/bin/perl

my $dpal = 0;
my $bpal = 0;
my $hpal = 0;
while(<>){
	my $d = $_;
	chomp($d);
	if($d eq "#"){ exit; }
	unless($d =~ /^\d+$/){ next; }
	$dpal = 0;
	$bpal = 0;
	$hpal = 0;
	my $b = unpack("B*", pack("N", $d));
	$b =~ s/^0+//;
	my $h = unpack("H8", pack("N", $d));
	$h =~ s/^0+//;
	#print"$d $b $h\n";
	my $dlen = length($d);
	my $blen = length($b);
	my $hlen = length($h);



	if($blen == 1){
		$bpal = 1;
		#print"$b is a palindrome\n";
	}elsif(($blen % 2) == 1){
		my $first = substr($b,0,(($blen - 1) / 2));
		my $second = substr($b,((($blen - 1) / 2)+1),$blen);
		#print"$first   $second\n";
		$second = reverse $second;
		#print"$first <=> $second\n";
		if($first eq $second){
			#print"$b is a palindrome";
			$bpal = 1;
		} else {
			#print"$b is NOT a palindrome";
		}
	} else {
		my $first = substr($b,0,(($blen) / 2));
		my $second = substr($b,((($blen) / 2)),$blen);
		#print"$first   $second\n";
		$second = reverse $second;
		#print"$first <=> $second\n";
		if($first eq $second){
			#print"$b is a palindrome";
			$bpal = 1;
		} else {
			#print"$b is NOT a palindrome";
		}
	}
	if($bpal == 0){ print"$d is NOT a binhex palindrome ($b,$h)\n"; next; }
	if($hlen == 1){
		$hpal = 1;
		#print"$h is a palindrome\n";
	}elsif(($hlen % 2) == 1){
		my $first = substr($h,0,(($hlen - 1) / 2));
		my $second = substr($h,((($hlen - 1) / 2)+1),$hlen);
		#print"$first   $second\n";
		$second = reverse $second;
		#print"$first <=> $second\n";
		if($first eq $second){
			#print"$h is a palindrome";
			$hpal = 1;
		} else {
			#print"$h is NOT a palindrome";
		}
	} else {
		my $first = substr($h,0,(($hlen) / 2));
		my $second = substr($h,((($hlen) / 2)),$hlen);
		#print"$first   $second\n";
		$second = reverse $second;
		#print"$first <=> $second\n";
		if($first eq $second){
			#print"$h is a palindrome";
			$hpal = 1;
		} else {
			#print"$h is NOT a palindrome";
		}
	}


	#print"\n";
	if($hpal == 0){ print"$d is NOT a binhex palindrome ($b,$h)\n"; next; }
	print"$d is a binhex palindrome ($b,$h)\n";
}

