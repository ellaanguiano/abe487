#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::DB::Fasta;
use Bio::Tools::SeqPattern;


my %opts = get_opts();

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

@ARGV == 2 or pod2usage();
my ($file, $pat) = @ARGV;
$pat =~s/\W//g;
my $db = Bio::DB::Fasta->new($file);
my @ids = grep {/$pat/} $db ->get_all_primary_ids;

say "Searching \'$file\' for \'$pat\'";

my $outfile = Bio::SeqIO ->new(-file=>">$pat", -format=>'fasta');
my $seqio   = Bio::SeqIO->new(-file=>$file, -format=>'fasta');
say "Found ", scalar(@ids). " ids";

if(scalar(@ids)>0){
    (my $filename = $pat)=~s/\W//g;
    $filename .= '.fa';

    $outfile = Bio::SeqIO->new(-file=>">$filename", -format=>'fasta');


    for my $id (@ids){
        my $seq = $db->get_Seq_by_id($id);
        $outfile->write_seq($seq);
    }   
    say "See results in ", $filename;
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

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl file.fa pattern

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
