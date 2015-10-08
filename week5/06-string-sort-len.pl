#!/usr/bin/perl env
# 06-string-sort-len.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    say "Please provide a list of sequences.";
}

my @sort_seq = sort{$a cmp $b}(@ARGV);
my @rev_sort = sort{$b cmp $a}(@ARGV);

print "sorted = ", join(', ', @sort_seq), "\n";
print "reverse = ", join(', ', @rev_sort), "\n";

