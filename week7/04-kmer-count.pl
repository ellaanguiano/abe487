#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use Data::Dumper;
use feature 'say';

my $seq       = shift or die "Please provide a sequence.\n";
my $kmer_size = shift || 3;

if (-e $seq) {
    open my $fh, "<", $seq;
    $seq = join '', <$fh>;
}

my $seq_len = length($seq);
unless ($seq) {
    die "Zero-length sequence.\n";
}

my $num_kmers = $seq_len - $kmer_size + 1;
if ($seq_len < $kmer_size){
    die "Cannot get any $kmer_size mers from a sequence of length $seq_len\n";
}

my %kmers;
for (my $i =0; $i < $num_kmers; $i++){
    my $kmer = substr($seq, $i, $kmer_size);
    $kmers{$kmer}++;
}

my $num_singles = 0;
while (my ($keys, $values) = each %kmers) {
    if ($values == 1){
        $num_singles++;
    }
}

my $numkmersfound = scalar(keys %kmers);

#say Dumper(\%kmers);

my $fmt = "%-15s %10s\n";
printf $fmt, "Sequence length", length($seq);
printf $fmt, "Mer size", $kmer_size;
printf $fmt, "Number of kmers", $num_kmers;
printf $fmt, "Unique kmers", $numkmersfound;
printf $fmt, "Num. singletons", $num_singles;

exit if $num_singles == $numkmersfound;

say "Most abundant";

my $i = 1;
for my $key (
    sort { $kmers{$b} <=> $kmers{$a} || $a cmp $b }
    keys %kmers 
) {
    my $count = $kmers{$key}; 
    last if $count == 1;
    say "$key: $count";
    last if $i == 10;
    $i++;
}


__END__
printf $fmt, "Mer size $kmer_size\n";
printf $fmt, "Number of kmers\n";
printf $fmt, "Unique kmer \n";
printf $fmt, "Num. singletons\n";
printf $fmt, "Most abundant \n";
