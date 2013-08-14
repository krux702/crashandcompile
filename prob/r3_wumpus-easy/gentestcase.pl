#!C:\strawberry\perl\bin\perl

my $test = shift;
unless($test =~ /^\d+$/){
	print "USAGE: ./gentestcase.pl <TESTCASE#>\n";
	exit;
}
open(FILE,">inputs/in$test");
my @grid = ();
my $ref = 0;
my $self = int(rand(100));
my $beast = int(rand(100));
while($beast == $self){
	$beast = int(rand(100));
}
my $treasure = int(rand(100));
while(($treasure == $self)||($treasure == $beast)){
	$treasure = int(rand(100));
}
for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
		if($ref == $treasure){
			$grid[$i][$j] = "_";
		} elsif ($ref == $beast){
			$grid[$i][$j] = "_";
		} elsif ($ref == $self){
			$grid[$i][$j] = "S";
		} else {
			$grid[$i][$j] = "_";
		}
		$ref++;
	}
}
#print "$ref\n";
for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
		print FILE $grid[$i][$j];
	}
	print FILE "\n";
}
for(my $f = 0; $f < int(rand(30)); $f++){
	my $ref = int(rand(4));
	my $dir = "N";
	if($ref == 0){
		$dir = "N";
	} elsif($ref == 1){
		$dir = "S";
	} elsif($ref == 2){
		$dir = "W";
	} else {
		$dir = "E";
	}
	print FILE "$dir\n";
}


close FILE;	
