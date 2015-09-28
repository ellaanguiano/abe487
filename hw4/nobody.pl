#!/usr/bin/env perl
#file: nobody.pl
use strict;
use warnings;

my $in  = 'Perl_III.nobody';
my $out = 'Perl_III.nobody';

open my $in_fh , '<', $in;
open my $out_fh, '<', $out;


while(my $line = <$in_fh>){
	chomp $line;
$line = lc $line;
my $no_ind = index($line, 'nobody');
my $so_ind = index($line, 'somebody');

if($no_ind != -1){
warn("Nobody is here: ", $no_ind, ".\n");
}
if($so_ind != -1){
warn("Somebody is here $so_ind.\n");
}
}
