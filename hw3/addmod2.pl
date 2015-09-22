
#! /usr/bin/perl
#file: add.pl
use strict;
use warnings;


my $first = shift(@ARGV);
my $second = shift(@ARGV);

if (defined $first) {
	print "$first is defined\n";
}
else {
	die  "Give me two numbers or else.\n";
}
if (defined $second) {
	print "$second is defined \n";
}
else{
	die "I need two numbers! Not just one, fool!\n";
}

$first >= 0 and $second >= 0 or die "Both numbers must be positive. \n";

print $first+$second, "\n " ;
