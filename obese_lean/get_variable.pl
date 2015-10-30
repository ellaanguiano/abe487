#!/usr/bin/env perl
##get_variable.pl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my @files = @ARGV or die "Please provide some FASTA files.\n";
my %ids;
my %readcount;
my $nfiles = scalar(@files);

for my $file(@files) {
    open my $fh, '<', $file;
    while (my $line = <$fh>){
        chomp $line;
        my ($id, $n) = split(/,/, $line);
        if ($n >= 50 ){
             $ids{ $id }++;
             $readcount {$id} += $n;
        }
}
}
my $i = 0;
for my $id (sort keys %ids) {
    if ( $ids{ $id } == $nfiles) {
        $i++;
    }
}

my $j = 0;
for my $id (sort keys %ids) {
    if ( $ids{ $id } <= $nfiles) {
        $j++;
    }
}
say Dumper(\%ids);
say Dumper(\%readcount);
print "$nfiles\n";

say "Found $i core ids. \n";
say "Found $j variable ids.\n";
