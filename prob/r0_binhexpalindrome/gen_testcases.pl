#!/usr/bin/perl

srand();
my %unique = ();
my @positive = `grep "is a" 1-5000.out.txt`;
my @palindromes = ();
foreach my $pos (@positive){
	chomp($pos);
	print "$pos is a match...\n";
	$pos =~ s/^(\d+) is a (.*)$/\1/;
	print "$pos is a match...\n";
	push(@palindromes,$pos);
}
for($i = 2; $i <= 10; $i++){
	open(OUT,">in$i.txt");
	for($j = 0; $j < 10; $j++){
		my $force = int(rand(100)) % 2;
		my $selection = int(rand(@palindromes));
		my $random = int(rand(10000));
		print "[$force]\n";
		if($force == 1){
			print "Adding a known palindrome...$palindromes[$selection]\n";
			print OUT $palindromes[$selection] . "\n";
		} else {
			print "Adding a random number: $random\n";
			print OUT "$random\n";
		}
	}
	print OUT "#\n";
	close OUT;
}
