#!/usr/bin/env perl
# 03-common-words.pl

use strict; 
use warnings; 
use autodie;
use feature 'say';
use Data::Dumper;

unless(scalar(@ARGV)==2){
    say "Please provide two file names."
};

my ($file1, $file2) = @ARGV;

open my $fh, '<', $file1;
open my $fh2, '<', $file2;

my %hash1;
my %hash2;
my @words;

while (my $line = <$fh>){
    chomp $line;   
#    print "$line \n";
    foreach my $word(split /\s+/, $line) {
        $word =~ s/[^A-Za-z0-9]//g;
        $hash1{lc($word)}++;
    } 
}

say Dumper(\%hash1);

while (my $line = <$fh2>){
    chomp $line;
#    print "$line \n";
    foreach my $word(split /\s+/, $line) {
        $word =~ s/[^A-Za-z0-9]//g;
        $hash2{lc($word)}++;
    }
}

say Dumper(\%hash2);

for my $word (sort keys %hash1) {
    if (exists $hash2{$word}){
        print"$word\n";
    }
}

