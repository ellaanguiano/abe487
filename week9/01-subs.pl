#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    } 
    my $program = $args{'program'} || pod2usage('No program');

    if ($program eq 'hello'){
        hello( $args{'argument'});
    }
    elsif ($program eq 'rc'){
        rc($args{'argument'});
    }

}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man_page',
        'program=s',
        'argument=s',
        
    ) or pod2usage(2);

    return %args;
}

sub hello {
    my $noun = shift;
    say "Hello, $noun";
}

sub rc {
    my $str = shift;
    $str =~ tr/ATGC/TACG/;
    $str = reverse($str);

    say $str;
}
__END__

# --------------------------------------------------

=pod

=head1 NAME

01-subs.pl - subroutine practice

=head1 SYNOPSIS

  01-subs.pl 

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
