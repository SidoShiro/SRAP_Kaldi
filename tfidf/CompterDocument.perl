#!/usr/bin/perl -w
use strict;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open IO => ':utf8';


my %vocab;
open VOCAB,$ARGV[0] or die "pas ouvert $ARGV[0]\n";
#calculer intelligemment le vocab 
shift ;
while (<VOCAB>) {
    chomp;
    $vocab{$_}=0;
#pour chaque mot, le compteur est initialisé à 0
}
my $docu="";
#stm dont le nom est à l'initiale
my %presence;
#les mots présents dans UN document
my $nombreDocu;
#nb de documents rencontrés, à 0 par défaut
while (<>)  {
    
    chomp;
    my @ligne=split;
    if ($docu ne $ligne[0]) {
	if ($docu ne "") {
	    foreach my $cle (keys %presence){
		$vocab{$cle}++ if (defined($vocab{$cle}));
	    }
	}
	$nombreDocu++;
	$docu=$ligne[0];
	%presence=();
	#réinitialisation de la table à vide pour chaque nouveau document
    }
    foreach  my $m  (@ligne[6..$#ligne]) {
	$presence{$m}++;
    }
}

if ($docu ne "") {
    foreach my $cle (keys %presence){
	$vocab{$cle}++ if (defined($vocab{$cle}));
    }
    $nombreDocu++;
}
    
foreach my $m (sort { $vocab{$b} <=> $vocab{$a}} keys %vocab) {
    print "$m ",log($nombreDocu/$vocab{$m}),"\n";
    
    #les petits : ils ont beaucoup d'existence dans les documents - ils sont dans beaucoup de docs indépendement du nbr de fois/d'occurrences.
    #IDF = pondération - pas fréquence dans la langue mais fréquence dans les documents
}
