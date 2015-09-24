#!/usr/bin/env perl
#file : caps.pl
use strict;
use warnings;
 
#provides the file to read from then the file to write to
print "Please provide file name to read to.\n";
print "Please provide file name to write to.\";
my $in = shift(@ARGV);
my $out = shift(@ARGV);
 
open(IN, '<', $in) or die "cannot open $in: $! \n";
open(OUT, '>', $out) or die "cannot open $out: $! \n";
while (my $line = <IN>) {
                chomp $line;
my $caps = uc $line;
print OUT "$caps \n";
