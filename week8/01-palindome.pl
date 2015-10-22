#!/usr/bin/env perl
#01-palindrome.pl

use strict;
use warnings;
use feature 'say';
use autodie;

my $phrase = shift or die "Please provide a word or phrase.";

my $pali = lc($phrase);
 $pali =~ s/[^a-zA-Z0-9]//g;

printf "%s\n", ($pali eq reverse $pali)? "Yes" : "No";

#i is case insensitive match
#
