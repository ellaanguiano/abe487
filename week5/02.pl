#!/usr/bin/env perl
# 02.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(@ARGV > 0){
   say "Please provide a list of numbers."
}

my $sumeven = 0;
my $sumodd = 0;

for my $num(@ARGV) {
    my $rem = $num % 2;
    if ($rem == 0) {
       $sumeven += $num ;
    }
    else {
       $sumodd += $num;
    }   

}

print "sum evens = ", $sumeven, "\n";
print "sum odds = ", $sumodd, "\n";
