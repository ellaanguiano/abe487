#!/usr/bin/env perl
# 04-array-ops.pl
use strict;
use warnings;
use autodie;
use feature 'say';

my @array = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);

print "array = ", join(', ', @array), "\n";
my $pop = pop(@array);
print "popped = ", $pop, ", array = ", join(', ', @array), "\n"; 

my $shift = shift(@array);
print "shifted = ", $shift, ", array = ", join(', ', @array), "\n";


push(@array, 12);
print "after push, array = ", join(', ', @array), "\n";

my $unshifted = unshift(@array);
print "after unshift, array = ", join(', ',@array), "\n";

print "array = ", join(', ', @array), "\n";

__END__

Please ensure the script is named properly so that it will be tested.  I 
should not have to guess at which script is the one to look at.  I had to 
assume the "04b" was the latest and best working example.

You failed the unshift test (see "test-out").

One point off.
