#!/usr/bin/env perl
# module_to_kegg.pl 

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

#checks to see if there are two files
unless(scalar @ARGV == 2){
    die "Please provide two files.\n"
};

#defines the files appropriately
my $cmet = shift @ARGV;
my $uproc = shift @ARGV;

#open the files
open my $fh, '<', $cmet;
open my $fh2, '<', $uproc;

#define the hashes that will be created from each file
#the first file will take modules with their associated Kegg ids
#and group them based on KEGG ids
#The second hash takes the KEGG ids from the Uproc file and sorts 
#them into KEGG number of occurences
my %kegg_to_module;  # this is my hash for modules to kegg ids;
my %keggct;

while (my $line = <$fh>){
    chomp $line;
    my ($module, $kegg) = split /\s+/, $line;

    push @{ $kegg_to_module{ $kegg } }, $module;
}
#say Dumper (\%kegg_to_module);



my %module_count;
while (my $line = <$fh2>){
    chomp $line;
    my ($kegg, $ct) = split /,/, $line;
    next unless exists $kegg_to_module{ $kegg };
    for my $module (@{ $kegg_to_module{ $kegg } }) {
        $module_count{ $module } += $ct;
    }
}

say Dumper(\%module_count); 

__END__
#my $ i = 0;
for my $kegg (sort keys %kegg_to_module){
    if (exists $keggct{$kegg}){
        say "$kegg modules = ", join ', ', @{ $kegg_to_module{$kegg} };
    }
    last;
}
