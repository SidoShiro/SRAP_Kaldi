#!/usr/bin/perl -w
use strict;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open IO => ':utf8';

#pour chaque document, son Tf-Idf, soit un vecteur dont chaque terme est un produit

my %vocab;
open VOCAB,$ARGV[0] or die "pas ouvert $ARGV[0]\n";
shift ;

print "Parse VOCAB\n";

while (my $line = <VOCAB>) {
    my @words = split ' ', $line;
    my $idf = $words[0];
    my $mot = $words[1];
    # chomp;
    # my ($mot,$idf)=/(\S+)\s+(\S+)/;
    print "MOT : $mot IDF : $idf\n";
    $vocab{$mot}=$idf;
}

#on relit et on a l'Idf

print "Sort VOCAB\n";

my @vocab=sort {$vocab{$a} <=> $vocab{$b}} keys %vocab;
my $docu="";
my %tf;
#tri pour avoir toujours le même ordre donc tableau

print "Normalise and etc... \n";
print "Docu : $docu\n";

while (<>) {
  chomp;
  my @ligne=split;
  if ($docu ne $ligne[0]) {
	  if ($docu ne "") {
	    my $maxi=0;
	    foreach my $cle (keys %tf){
		    $maxi=$tf{$cle} if (defined($vocab{$cle}) && $maxi<$tf{$cle});
	    }
	    #normaliser pour éviter les biais par le mot le plus fréquent
	    print "$docu";
	    foreach my $m (@vocab) {
		    if (defined($tf{$m})) {
		      print " ", $tf{$m}/$maxi*$vocab{$m};
		      #tf-idf normalisé
		    }
        else { print " 0";}
	    }
	    print "\n";
	  }
	  $docu=$ligne[0];
	  %tf=();
  }
  foreach  my $m  (@ligne[6..$#ligne]) {
	  $tf{$m}++;
  }
}

if ($docu ne "") {
  my $maxi=0;
  foreach my $cle (keys %tf){
  
    $maxi=$tf{$cle} if (defined($vocab{$cle}) && $maxi<$tf{$cle});
  }
  #normaliser pour éviter les biais par le mot le plus fréquent
  print "$docu";
  foreach my $m (@vocab) {
    if (defined($tf{$m})) {
      print " ", $tf{$m}/$maxi*$vocab{$m};
      #tf-idf normalisé
  }
  else { 
    print " 0";}
  }
  print "\n";
}







