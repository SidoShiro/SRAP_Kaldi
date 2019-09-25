#!/usr/bin/perl -w
use strict;
my $shift=1;
my $cumul=0;
if ($#ARGV>=0) {
    $shift=$ARGV[0];
    shift;
}
while (<>) {
next if (/^;;|ignore_time_segment_in_scoring/);  
next if (/inter_segment_gap/);
    my @l=split;
    print STDERR if (($l[3+$shift]-$l[2+$shift])>120.0);
#    next if  (($l[3+$shift]-$l[2+$shift])>40.0);
    $cumul += $l[3+$shift]-$l[2+$shift];
} 
printf ("%.2f  %d %.0f\n", $cumul/3600,$cumul,$cumul/60);
