
#! /usr/bin/perl
#file: add.pl
use strict;
use warnings;


my $first = shift(@ARGV);
my $second = shift(@ARGV);

if (defined $first) {
	print "$first is defined\n";
}
elsif ($first >= 0) {
	print "This needs to be positive! \n";
}
elsif {
	die  "Give me two numbers or else.\n";
}
if (defined $second) {
	print "$second is defined \n";
}
elsif ($second >= 0) {
	print "This needs to positive! \n";
}
elsif{
	die "I need two numbers! Not just one, fool!\n";
}


print $first+$second ;
