#!/usr/bin/perl

srand();
my %unique = ();
for($i = 2; $i <= 10; $i++){
	open(OUT,">in$i.txt");
	for($j = 0; $j < 10; $j++){
		my $force = int(rand(100)) % 2;
		my $selection = int(rand(@palindromes));
		my $random = int(rand(10000));
		my @sum = ();
		print "[$force]\n";
		if($force == 1){
			for($m=0;$m<=(int(rand(3))+2);$m++){
				if($m == 0){
					push(@sum,(int(rand(10))+1)."9");
				} else {
					push(@sum,int(rand(50)));
				}
			}
			my $result = eval(join("+",@sum));
			print "Creating a true eval...\n";
			print OUT join("+",@sum) . "=$result\n";
		} else {
			for($m=0;$m<=(int(rand(3))+2);$m++){
				if($m == 0){
					push(@sum,(int(rand(10))+1)."9");
				} else {
					push(@sum,int(rand(50)));
				}
			}
			my $result = eval(join("+",@sum)) + int(rand(10)) + 1;
			print "Creating a false eval...\n";
			print OUT join("+",@sum) . "=$result\n";
		}
	}
	print OUT "#\n";
	close OUT;
}
