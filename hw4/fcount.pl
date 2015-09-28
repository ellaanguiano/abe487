#!usr/bin/env perl
#file: fcount.pl
use strict; 
use warnings;
use autodie;
use feature 'say';

my $inf = shift || 'Perl_III.fastq';
open my $inf_fh, '<', $inf;

my ($lc, $length) = (0,0);

while (my $line = <$inf_fh>) {
	$lc = $lc++;
	$length = length($line);

}

print "There are ", $lc, "  lines. \n";
print "The total number of characters are", $length, ". \n";
print "The Average line length is ", $length/$lc;

