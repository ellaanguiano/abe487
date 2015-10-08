
#!/usr/bin/perl env
# 07-gc.pl
use strict; 
use warnings;
use autodie;
use feature 'say';

unless(scalar@ARGV > 0) {
    say "Please provide a sequence.";
}


my @inputseqs = (@ARGV);
my $seq  = shift(@inputseqs);
my @sequence = split(//, $seq);
my $len = 0;
my $GC = 0;


foreach my $bp sort {uc($a) cmp uc($b)} @sequence {
    if ($bp eq 'c' || $bp eq 'g'){
       $GC++ ;
    }else {
        $len++;
    }
}

print "Seq : ", @ARGV, "\n";
print "Length: ", $len, "\n";
print "#GC : ",$GC, "\n";
print "Percent GC = ", $GC/$len, "\n";






#print "Seq : ", @ARGV, "\n";
#print "Length: ", @len, "\n";
#print "#GC : ",
#print "% 
