#!/usr/bin/env perl
#04-kmer-count.pl
use strict;
use warnings;
use autodie;
use Data::Dumper;
use feature 'say';

my $sequence = @ARGV;

unless (scalar 
