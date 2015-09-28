#!/usr/bin/env perl
#file : caps.pl
use strict;
use warnings;
use autodie;
use feature 'say';

  
unless(scalar(@ARGV) == 2){
	die "Please provide 2 arguments";
}

my $in  = shift(@ARGV);
my $out = shift(@ARGV) ;

open(my $in_fh, '<', $in);
open(my $out_fh, '>', $out);

while (my $line = <$in_fh>) {

	print $out_fh uc $line;
}

say "'$in' => '$out";
 
