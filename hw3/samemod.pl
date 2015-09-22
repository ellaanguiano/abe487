
#! /usr/bin/perl
# file: same.pl
use strict;
use warnings;

my $string1 = shift(@ARGV);
my $string2 = shift(@ARGV);


if(! defined($string1) or ! defined($string2)) {
	print "I need two strings, yo. \n" ;
} 
	elsif (lc($string1) eq lc($string2)) {
		print "same \n";
	}
	else {
		print "different \n";
	}

