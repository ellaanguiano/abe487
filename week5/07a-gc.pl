#!/usr/bin/perl env
# 07-gc.pl
use strict; 
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    say "Please provide a sequence.";
}

my $seq = (@ARGV);
my @len = $seq =~ //gi;

foreach my $letter (sort {uc($a) cmp uc($b)} @words {
    if ($letter eq 'g' && 'c'){
    }
   print "$letter\n";
}

print "Seq : ", @ARGV, "\n";
print "Length: ", @len, "\n";
#print "#GC : ",
#print "% 
