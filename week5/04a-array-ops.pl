
#!/usr/bin/env perl
# 04-array-ops.pl
use strict;
use warnings;
use autodie;
use feature 'say';

my @array = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);

print "array = ", join(', ', @array), "\n";
my $pop = pop(@array);
my $shift = shift(@array);
push(@array, 12);
my $unshifted = unshift(@array);

print "array = ", join(', ', @array), "\n";
print "popped = ", $pop, ", array = ", @array, "\n";
print "shifted = ", $shift, ", array = ", @array, "\n";
print "after push, array = ", join(', ', @array), "\n";
print "after unshift, array = ", join(', ',@array), "\n";

