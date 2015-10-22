#!/usr/bin/env perl
#extra-credit.pl


use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $file = shift || ;
open $fh, '<', $file;

my %enzymes;

while (my $line = <$fh>){
    

print "There are $enymes enzymes.";


