#!/usr/bin/perl env
# 07-gc.pl
use strict; 
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    say "Please provide a list of sequences.";
}

print "Seq : ", @ARGV, "\n";
#print "Length: ", $len, "\n";
#print "#GC : ",
#print "% 
