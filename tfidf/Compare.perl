#!/usr/bin/perl -w
use strict;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open IO => ':utf8';


my @V=@ARGV;
#récupération du nom de fichier et ses 1000 (vocab) calcul correspondant à son Tf-Idf
my $nv=0;
foreach my $a (@V[1..$#V]) {
    $nv+=$a*$a;
}
$nv=sqrt($nv);
#racine carrée de la somme des carrés des nbrs de la ligne

@ARGV=();
#tableau des arguments à zéro
while (<>) {
    chomp;
    my @ligne=split;
    my $ne=0;
    my $sum=0;
    for (my $i =1; $i<=$#ligne; $i++) {
	$ne+=$ligne[$i]*$ligne[$i];
	$sum+=$ligne[$i]*$V[$i];
	#produit scalaire (produit des composantes 2 à 2 dont on fait la somme, cf. vecteur)
#	print STDERR "$i $ne $sum $ligne[$i] $V[$i]\n";
    }
    $ne=sqrt($ne);
    print "$ligne[0] ",$sum/($ne*$nv),"\n";
    #distance cosinus = produit scalaire divisé par produit des deux normes des 2 vecteurs

}






