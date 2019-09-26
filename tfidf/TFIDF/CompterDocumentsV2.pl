#!/usr/bin/perl -w
use strict;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open IO => ':utf8';

my %Nuage;
while (<>)  {
    chomp;
    my @ligne=split;
    #les horizontauxtab > ceux qui coupent
    foreach my $mot (@ligne)
    {
      $Nuage{$mot}++;
    }
}

foreach my $mot (sort {$Nuage{$b} <=> $Nuage{$a}} keys %Nuage)
#comparaison de chaîne de caractères = cmp, sinon pour nb <=>
{
  print "$Nuage{$mot} $mot\n";
}

