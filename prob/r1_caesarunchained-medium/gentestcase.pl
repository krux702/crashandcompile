#!C:\strawberry\perl\bin\perl

my $string = shift;
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
if($action eq ""){
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
}
