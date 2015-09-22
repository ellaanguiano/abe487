#!/usr/bin/env perl

#file: add.pl
use strict;
use warnings;

if (scalar(@ARGV) != 2) {
    die "I need two numbers.\n";
}

#unless (scalar(@ARGV) == 2) {
#    die "I need two numbers.\n";
#}

my $first = shift(@ARGV);
my $second = shift(@ARGV);

if (defined $first) {
	print "$first is defined\n";
}
elsif ($first >= 0) {
	print "This needs to be positive! \n";
}
else {
	die  "Give me two numbers or else.\n";
}

if (defined $second) {
	print "$second is defined \n";
}
elsif ($second >= 0) {
	print "This needs to positive! \n";
}
else {
	die "I need two numbers! Not just one, fool!\n";
}


print $first+$second ;
