#! /usr/bin/perl
# file: reorder.pl
use strict;
use warnings;

my $string1 = shift(@ARGV);
my $string2 = shift(@ARGV);

if(! defined($string1) or ! defined($string2)) {
	print "I need two strings, yo. \n";
}
else{
	if (($string1 cmp $string2) > 0) {
		print "$string2 $string1 \n";
		}
	else {
		print "$string1 $string2 \n";
	}
}

