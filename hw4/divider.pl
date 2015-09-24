#!/usr/bin/env perl
#file : divider.pl
use strict;
use warnings;

my $num1 = shift(@ARGV);
my $num2 = shift(@ARGV);


my $ err = "error.txt";
my $divider_out = "div.out";
open(OUT, '>', $divider_out) or die "Can't write to outfile (doesn't exist): $! \n";
open(STDERR, '>', $err) or die "Can't write to errorfile: $!\n";

if(! defined $num1 && ! defined $num2){
	die "Please provide two numbers!\n";
else($num2 == 0 ){
	die "Cannot divide by zero.\n";
if( defined $num1 && defined $num2 && $num1 > 0 && $num2 > 0){
	my $divider = $num1 / $num2;
	print OUT $divider, "\n";
}
else { 
	print STDERR "Numbers can't be negative!. \n";
}

