#!/usr/bin/env perl
#03-fasta.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(@ARGV > 1){
    say "Please provide a FASTA file.";
}

my $file = shift @ARGV;
open my $fh, '<', $file or say "Can't open $file: $!\n";

my $count;

while (my $line = <$fh>) {
    chomp $line; 
    if ($line =~ /^>(.+)/){
        $count++;
        say "$count: $1";
}
printf "Found $count sequence%s. \n", ($count ==1) ? '' : 's';
 
}
