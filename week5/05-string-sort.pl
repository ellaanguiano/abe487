#!/usr/bin/env perl
# perl 05-string-sort.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    die "Please provide a list of sequences.\n";
}

my @sort_seq = sort{$a cmp $b}(@ARGV);
my @rev_sort = sort{$b cmp $a}(@ARGV);

print "sorted = ", join(', ', @sort_seq), "\n";
print "reverse = ", join(', ', @rev_sort), "\n";


