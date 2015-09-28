#!/usr/bin/env perl
#file: rev.pl
use strict;
use warnings;
use feature 'say';

open my $infile_fh, '<','Perl_III.fasta';

while( my $line = <$infile_fh>){
chomp($line);

my $rev = reverse ($line);
if (substr($line, 0, 1) eq '>') { 			#This is used because fasta files all start with the >
	say "$line (revcomp)";
}
else {
my $ rev = reverse $line;
$rev =~ tr/ACGTacgt/TGCAtcga/;
say $line;
}
}


