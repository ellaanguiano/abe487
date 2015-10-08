#!/usr/bin/env perl
# 04-array-ops.pl
use strict;
use warnings;
use autodie;
use feature 'say';

my @array = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);

my $pop = pop(@array);

print "array = ", join(', ', @array), "\n";
