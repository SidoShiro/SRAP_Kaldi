#!/usr/bin/perl -w
use strict;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open IO => ':utf8';
my $theme;
my %theme;
my $fich=shift;
open DICO,$fich or die "pas ouvert $fich\n";
while (<DICO>) {

    chomp;
    my @l=split('_');
    my $theme=$l[$#l];
    my $fich=join('_',@l[0..$#l-1]);
    $theme{$fich}=$theme;
}


while (<>) {
    next if (/^;;|ignore_time_segment_in_scoring|inter_segment_gap/);

    my ($show)=/(\S+)/;

    if (defined($theme{$show})) {
	s/$show/$theme{$show}/;
    }
    print;


}
