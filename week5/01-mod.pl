#!/usr/bin/env perl
# 01-mod.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(@ARGV > 0){
   die "Please provide a list of numbers.\n"
}

my @evens;

for my $num(@ARGV) {
    my $rem = $num % 2;
    if ($rem == 0) {
       push @evens, $num;
    }   
}

print "evens = ", join(', ',  @evens), "\n"; 
