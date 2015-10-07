#!/usr/bin/env perl
# 01-mod.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(@ARGV > 0){
   say "Please provide a list of numbers."
}

my @evens;
my @odds;
for my $num(@ARGV) {
    my $rem = $num % 2;
    if ($rem == 0) {
       push @evens, $num;
    }
    else {
        push @odds, $num,
    }   
    say $rem;  
}

print "evens = ", join(', ',  @evens), "\n";
print "odds = ", join(', ', @odds), "\n";
