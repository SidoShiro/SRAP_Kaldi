#!/usr/bin/perl -w
use strict;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open IO => ':utf8';


my %vocab;
open VOCAB,$ARGV[0] or die "pas ouvert $ARGV[0]\n";
shift ;
while (<VOCAB>) {
    chomp;
    $vocab{$_}=0;
}
my $docu="";
my %presence;
while (<>)  {
    
    chomp;
    my @ligne=split;
    if ($docu ne $ligne[0]) {
	if ($docu ne "") {
	    foreach $cle (keys %presence)
	    
#les horizontauxtab > ceux qui coupent
foreach my $mot (@ligne)

{$Nuage{$mot}++;
}
}

foreach my $mot (sort {$Nuage{$b} <=> $Nuage{$a}} keys %Nuage)
#comparaison de chaîne de caractères = cmp, sinon pour nb <=>
{
print "$Nuage{$mot} $mot\n";
}

