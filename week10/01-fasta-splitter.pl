#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Cwd;
use File::Basename 'basename';
use File::Path qw(make_path remove_tree);
use File::Spec::Functions 'catfile';

my %opts = get_opts();

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

my @args     = @ARGV or pod2usage();
my $max      = $opts{number} || 500;
my $out_dir  = $opts{out_dir}|| cwd();


unless(-d $out_dir){
    make_path($out_dir);
}

for my $file (@args) {
    say "file $file";
    my $in = Bio::SeqIO->new(-file => $file,
                             -format => 'fasta');
    my $count = 0;
    my $filecount = 1;
    my $out = Bio::SeqIO->new(-file=> ">$file.$filecount", -format=>'fasta');
    while ( my $seq = $in->next_seq() ){
        $count++;
        if ($count > $max) {
        my $path = catfile($out_dir, $file);
            $count = 1;
            $filecount++;
            $out = Bio::SeqIO->new(-file => ">$file.$filecount", -format =>'fasta');
            $out->write_seq($seq);
        }

        $out->write_seq($seq);
    }
}

say "Done.";

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'number=i',
        'out_dir=s',
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl 

Options:

  --number  The maximum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation

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
