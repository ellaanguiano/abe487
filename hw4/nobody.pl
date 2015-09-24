#!/usr/bin/env perl
#file: nobody.pl
use strict;
use warnings;

while(my $line = <>){
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
