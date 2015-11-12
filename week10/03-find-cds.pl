#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;

my %opts = get_opts();
my @args = @ARGV or pod2usage();

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

for my $file (@args) {
    my $seqio_obj = Bio::SeqIO->new(-file => $file,
                            -format => 'Genbank');
    my $count = 0;
    while (my $seq_obj = $seqio_obj->next_seq) {
        my @cds;
        for my $feat_obj ($seq_obj->get_SeqFeatures){
            if ( $feat_obj->primary_tag eq 'CDS' ) {
                push @cds, $feat_obj->get_tag_values("translation");
                $count++;
               # my $seq_id = $seq_obj->id;
               # my $ncds = scalar @cds;
               # say "seq_id has $ncds CDS";
               # my $i;
               # for my $cds(@cds){
               # say ++$i, ": ", $cds->get_tag_values('translation');
               # }
            }
        } 
        my $num_cds = scalar(@cds);
        say $seq_obj->id, " has $num_cds CDS.";
    }
}

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

03-find-cds.pl - a script

=head1 SYNOPSIS

  03-find-cds.pl file1.gb [file2.gb ...]

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Ella Monique Anguiano E<lt>ellaanguiano@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 ellaanguiano

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
