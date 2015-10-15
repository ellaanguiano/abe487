#!/usr/bin/env perl
# 02-fasta-hash.pl
use strict; 
use warnings;
use feature 'say';
use Data::Dumper;
use autodie;

my $file = shift @ARGV || "Perl_V.genesAndSeq.txt";
open my $fh, '<', $file;
my %hash;

while (my $line = <$fh>){
    chomp $line;
    my ($key, $value) = split/\t/, $line;
    $hash{$key} = $value;
}

for my $key (sort keys %hash){
    my $value = $hash{$key};
    print "key: $key value:$value \n";
} 

