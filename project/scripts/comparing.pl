#!/usr/bin/env perl
#comparing.pl


use strict; 
use warnings; 
use autodie;
use feature 'say';
use Data::Dumper;

unless(scalar(@ARGV)==2){
    die "Please provide two files.\n"
};

my ($cmet, $uproc) = @ARGV;

open my $fh, '<', $cmet;
open my $fh2, '<', $uproc;

my %cmet;
my %kegg;

while (my $line = <$fh>){
    chomp $line;   
    my ($module, $kegg) = split /\s+/, $line; 
    push @{$cmet{$kegg}}, $module;
}


#say Dumper (\%cmet);

my %module_count;
while (my $line = <$fh2>){
    chomp $line;
    my ($kegg, $ct) = split /,/, $line;
    next unless exists $cmet{ $kegg };
    for my $module (@{ $cmet{ $kegg } }) {
        $module_count{ $module } += $ct;
    }
}

#say Dumper (\%module_count);

my $mod;
my $numids;
foreach $mod (sort { $module_count{$b} <=> $module_count{$a}} keys %module_count){
    my $numids = $module_count{$mod};
        if ($numids <= 5000){
            my $small = $mod;
            say "small: ", join(', ', $mod, $module_count{$mod});
            my $smallfile = 'small.txt';
            open (my $fh3,'>>', $smallfile);
            print $fh3 $small, "\t W5 \n";
            close $fh3;
        }
        elsif ($numids <= 50000){
            my $medium = $mod;
            say "medium: ", join(', ', $mod, $module_count{$mod});
            my $mediumfile = 'medium.txt';
            open (my $fh4, '>>', $mediumfile);
            print $fh4 $medium, "\t W15 \n";
            close $fh4;
        }
        else {
            my $large = $mod;
            say "large: ", join (', ', $mod, $module_count{$mod});
            my $largefile = 'large.txt';
            open (my $fh5, '>>', $largefile);
            print $fh5 $large, "\t W30 \n";
            close $fh5;
        }
    #print "$mod appears $numids times \n";
}

#this part compares the kegg ids from the module to the kegg ids found in the
#uproc file

