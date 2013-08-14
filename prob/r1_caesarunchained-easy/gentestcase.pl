#!C:\strawberry\perl\bin\perl

my $string = shift;
my $action = shift;
my $testref = "";
if(($string eq "")||($testref eq "")){
	print "Usage: ./gentestcase.pl \"STRING TO ENCRYPT\" <TESTCASE#>\n";
	print "Usage: ./gentestcase.pl \"BLAH BLAH\" 6\n";
	exit;
}
if($action =~ /^\d+$/){
	$testref = $action;
	$action = "";
}
if(($action eq "")&&($string eq "")){
	while(<>){
		my $line = $_;
		chomp($line);
		if($line eq "#"){ last; }
		$string = $line;
	}
}
if(-e $string){
	open(FILE,"$string");
	while(<FILE>){
		my $line = $_;
		chomp($line);
		$string = $line;
		if($line eq "#"){ last; }
	}
	close FILE;
}
my %char2num = qw(
A	1
B	2
C	3
D	4
E	5
F	6
G	7
H	8
I	9
J	10
K	11
L	12
M	13
N	14
O	15
P	16
Q	17
R	18
S	19
T	20
U	21
V	22
W	23
X	24
Y	25
Z	26);
my %num2char = reverse %char2num;
my $result = "";
if($action eq "encrypt"){
	my @plain = split(//,$string);
	my $prev = "";
	foreach my $char (@plain){
		if(!($char =~ /[A-Z]/)){
			$result .= $char;
		} elsif($prev eq ""){
			$new = $char2num{$char} + 3;
			if($new > 26){ $new -= 26; }
			$prev = $new;
			$newchar = $num2char{$new};
			$result .= $newchar;
		} else {
			$new = $char2num{$char} + $prev;
			if($new > 26){ $new -= 26; }
			$prev = $new;
			$newchar = $num2char{$new};		
			$result .= $newchar;
		}
	}
	print "$result\n";
} elsif(($testref ne "")) {
	print "Writing $string to unchained-out-".$testref.".txt...\n";
	open(FILE,">out$testref.txt");
	print FILE "$string\n#\n";
	close FILE;
	print "Encrypting $string...\n";
	my @plain = split(//,$string);
	my $prev = "";
	foreach my $char (@plain){
		if(!($char =~ /[A-Z]/)){
			$result .= $char;
			print "$char -> $char\n";
		} elsif($prev eq ""){
			print "$char -> $char2num{$char} + 3 -> ";
			$new = $char2num{$char} + 3;
			print "$new-> ";
			if($new > 26){ $new -= 26; }
			print "$new -> ";
			$prev = $new;
			$newchar = $num2char{$new};
			print "$newchar\n";
			$result .= $newchar;
		} else {
			print "$char -> $char2num{$char} + $prev -> ";
			$new = $char2num{$char} + $prev;
			print "$new -> ";
			if($new > 26){ $new -= 26; }
			print "$new -> ";
			$prev = $new;
			$newchar = $num2char{$new};		
			print "$newchar\n";
			$result .= $newchar;
		}
	}
	print "Decrypting $result...\n";
	my @plain = split(//,$result);
	my $initial = $result;
	$result = "";
	my $next = "";
	foreach my $char (@plain){
		if(!($char =~ /[A-Z]/)){
			print "$char -> $char\n";
			$result .= $char;
		} elsif($next eq ""){
			print "$char -> $char2num{$char} - 3 -> ";
			$next = $char2num{$char}; 
			$new = $char2num{$char} - 3;
			print "$new -> ";
			if($new <= 0){  
				$new = 26 + $new;
			}
			print "$new -> ";
			$newchar = $num2char{$new};
			print "$newchar\n";
			$result .= $newchar;
		} else {
			print "$char -> $char2num{$char} - $next -> ";
			$new = $char2num{$char} - $next;
			print "$new -> ";
			if($new <= 0){  
				$new = 26 + $new;
			}
			print "$new -> ";
			$newchar = $num2char{$new};		
			print "$newchar\n";
			$result .= $newchar;
			$next = $char2num{$char}; 
		}
	}
	print "CHECKING: [$result] -> [$string]\n";
	if($result eq $string){
		print "VALIDATED!\n";
		print "Writing $initial to unchained-in-".$testref.".txt...\n";
		open(FILE,">in$testref.txt");
		print FILE "$initial\n#\n";
		close FILE;
	}

} elsif(($action eq "decrypt")||($action eq "")) {
	my @plain = split(//,$string);
	my $next = "";
	foreach my $char (@plain){
		if(!($char =~ /[A-Z]/)){
			$result .= $char;
		} elsif($next eq ""){
			$next = $char2num{$char}; 
			$new = $char2num{$char} - 3;
			if($new <= 0){  
				$new = 26 + $new;
			}
			$newchar = $num2char{$new};
			$result .= $newchar;
		} else {
			$new = $char2num{$char} - $next;
			if($new <= 0){  
				$new = 26 + $new;
			}
			$newchar = $num2char{$new};		
			$result .= $newchar;
			$next = $char2num{$char}; 
		}
	}
	print "$result\n";
}


