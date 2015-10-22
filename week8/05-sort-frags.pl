#!/usr/bin/env perl
#05-sort-frags.pl

use strict;
use warnings;
use feature 'say';
use autodie;

say join "\n", sort{length($a)<=>length($b)}split(/\^/, <>)
