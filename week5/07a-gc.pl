

#!/usr/bin/perl env
# 07-gc.pl
use strict; 
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    say "Please provide a sequence.";
}


my @inputseqs = map{lc} (@ARGV);
my $seq  = shift(@inputseqs);

for my $sequence(@inputseqs){
    my @sequence = split(//, $sequence);
my $len = 0;
my $GC = 0;

foreach my $bp(  @sequence){
    if (($bp eq 'c') or ($bp eq 'g')){
       $GC++ ;
    }
        $len++;
    }

print "Seq : ", @ARGV, "\n";
print "Length: ", $len, "\n";
print "#GC : ",$GC, "\n";
print "Percent GC = ", $GC/$len, "\n";






#print "Seq : ", @ARGV, "\n";
#print "Length: ", @len, "\n";
#print "#GC : ",
#print "% 
