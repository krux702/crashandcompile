#!C:\strawberry\perl\bin\perl

	while(<>){
		my $line = $_;
		chomp($line);
		if($line eq "#"){ last; }
		$string = $line;
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


