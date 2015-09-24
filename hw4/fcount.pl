#!usr/bin/env perl
#file: fcount.pl
use strict; 
use warnings;

my $inf = 'PerlIII.fastq';
open(IN, '<', $inf) or die "File would not read: $! \n";

my $lc = 0;
while (my $line = <$inf>) {
	$lc = $lc + 1;
	my $length = length($line);
}
my $ave = $length/$lc;

print "There are ", $lc, "  lines. \n";
print "The total number of characters are", $length, ". \n";
print "The Average line length is ", $ave, ". \n";

