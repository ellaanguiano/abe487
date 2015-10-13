#!/usr/bin/perl env
# 06-string-sort-len.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    die "Please provide a list of sequences.\n";
}

my @sort_seq = sort{length($a) <=> length($b)}(@ARGV);
my @rev_sort = sort{length($b) <=> length($a)}(@ARGV);

print "sorted = ", join(', ', @sort_seq), "\n";
print "reverse = ", join(', ', @rev_sort), "\n";

