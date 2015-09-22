#! /usr/bin/perl
# file: percent.pl

use strict;
use warnings;

my $i = shift(@ARGV);
my $j = shift(@ARGV);

if (! defined($i) or ! defined($j)){
	print "Provide two numbers. \n";
}
else {
	print "You did it, we have enough numbers!\n";
}
if (($i + $j) != 0) {
	
	printf "%0.2f%% \n", 100 * ($i/($i+$j)), " %\n";
}
	else {
		print "Don't go there, you're trying to divde by 0!\n";
}
