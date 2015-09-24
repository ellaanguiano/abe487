#!/usr/bin/env perl
#file: rev.pl
use strict;
use warnings;

my $inf = shift(@ARGV);
my $outf = shift(@ARGV);

open(IN, '<', $inf) or die "Cannot open $inf: $! \n";
open(OUT, '>', $outf) or die "Cannot opent $outf: $! \n";

