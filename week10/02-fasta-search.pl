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

@ARGV == 2 or pod2usage();
my $file  = $ARGV[0];
my $pat   = $ARGV[1];
$pat =~s/\W//g;

my $outfile = Bio::SeqIO ->(-file=>">$pat", -format=>'fasta');
my $seqio   = Bio::SeqIO->new(-file=>$file, -format=>'fasta');
my $pattern1 = Bio::Tools::SeqPattern->new(-ID =>$pat, -TYPE =>'fasta' );

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

say "Searching \'$file\' for \'$pat\'";

my $db = Bio::DB::fasta->new($file);
$outfile = Bio::SeqIO(-file=>">$pat.fa", -format=>'fasta');
my @ids = grep {/$pat/} $db ->get_all_primary_ids;

for my $id (@ids){
    my $seq = $db->get_Seq_by_id($id);
    $outfile->write_seq($id);
}

my $i = @ids;

printf "Found %s id%s\n", $i, $i ==1? '' : 's';

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
