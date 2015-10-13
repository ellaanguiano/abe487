#!/usr/bin/env perl
# 07-snps.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless ( scalar @ARGV == 2 ) {
    die "Please provide two sequences. \n";
}

my ( $seq, $seqa ) = @ARGV;

if ( length($seq) ne length($seqa) ) {
    die "Please give two, same-length sequences.";
}

my $numsnps;

for ( my $i = 0 ; $i < length($seq) ; $i++ ) {
    my $seq1 = substr $seq,  $i, 1;
    my $seq2 = substr $seqa, $i, 1;
    if ( $seq1 ne $seq2 ) {
        $numsnps++;
        say "Position: ", $i + 1, " ", $seq1, "=>", $seq2;
    }
}

say "Found $numsnps SNPs. \n";

