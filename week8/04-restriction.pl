#!/usr/bin/env perl
#04-restriction.pl

use strict;
use warnings;
use autodie;
use feature 'say';

my $seq = shift or die "Please provide a sequence or file.\n";

my $str ='';
open (my $fh, '<', $seq);

while(my $line = <$fh>){
    chomp $line;
    $str .= $line;
}

$str =~ s/([AG])(AATT[CG])/$1^$2/gi;

print "$str \n";
 
