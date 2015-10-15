#!/usr/bin/env perl
# 01-cities.pl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my %homes = (
    'Tucson'      => 'AZ',
    'Simi Valley' => 'CA',
    'Kent'        => 'WA',
    'Marysville'  => 'WA',
);

say Dumper(\%homes);

foreach my $city (sort keys %homes) {
    my $aa = $homes{$city};
    print "$city, $aa \n";
}

