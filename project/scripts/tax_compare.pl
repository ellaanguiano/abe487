#!/usr/bin/env perl
#tax_compare.pl


use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

unless(scalar(@ARGV)==2){
    die "Please provide two files.\n"
};

my ($genusfile, $readfile) = @ARGV;

open my $fh, '<', $genusfile;
open my $fh1, '<', $readfile;

my %genushash;
my %readhash;

my $genusname;
while (my $line = <$fh>){
    chomp $line;
    my ($tax_id, $genus) = split /\s+/, $line;
    $genushash{$tax_id} = $genus;
    $genusname = $genus;
}

#say Dumper(\%genushash);
#my %id_count;
while (my $line = <$fh1>){
    chomp $line;
    my ($readnum, $tax_id) = split /\s+/, $line;
    $readhash{$tax_id}++;
}

#say Dumper(\%readhash);

for my $id ( %genushash) {
    if (exists $readhash{ $id }) {
        say "Genus:$genusname, Tax_id: $id";
        my $genusfile = 'genus.txt';
        open (my $fh2, '>>', $genusfile);
        print $fh2 $genusname, ", ", $id, "\n";
    }
}

__END__
my $id;
my $sorted_ids_val;
foreach $id (sort { $readhash{$b} <=> $readhash{$a}} keys %readhash){
    $sorted_ids_val = $readhash{$id};
    say join (', ', $id, $sorted_ids_val);
}

for my $name ( values %genushash) {
    if (exists $id) {
        say $name, $id;
    }
}


__END__
while (my $line = <$fh1>){
    chomp $line;
    my ($readnum, $tax_id) = split /\s+/, $line;
   # $readhash{$tax_id}++;
    next unless exists $genushash{ $tax_id};
    for my $id (@{$genushash{ $tax_id } }) {
        my $genus_taxa{ $id }++; 
        #if (exists $readhash{$id}){
            #say $id;
    }
}

__END__
for my $id (sort keys %genushash){
    if (exists $readhash{$id}){
        say $id;
    }
}

