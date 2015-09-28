#!/usr/bin/env perl
#file : divider.pl
use strict;
use warnings;
use autodie;
use feature 'say';

unless(scalar(@ARGV) == 2){
	die "Please provide 2 numbers.\n"
}

my ($num1, $num2) = @ARGV;



my $err = "error.txt";			 # this is the file I am printing error messages to
my $divider_out = "div.out"; 		 #this is the file I am printing out to

open(my $divider_out_fh, '>', $divider_out) or die "Can't write to outfile (doesn't exist): $! \n";
open(my $err_fh, '>', $err) or die "Can't write to errorfile: $!\n";

say $num1/$num2;


