#!/usr/bin/env perl
# file: 03-sort.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(@ARGV > 0){
    die "Please provide a list of numbers.\n";
}

my @sortnum = sort @ARGV ;
my @numnum  = sort {$a <=> $b}(@ARGV);
my @revsort = sort {$b <=> $a}(@ARGV);

print "default sort = ", join(', ' , @sortnum), "\n";
print "numerical sort = ", join(', ' , @numnum), "\n";
print "reverse numerical sort = ", join(', ' , @revsort), "\n";

__END__

You must "die" if the arguments don't exist!
