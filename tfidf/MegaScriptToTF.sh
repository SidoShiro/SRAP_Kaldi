#!/bin/sh

tf_result="tf_result"

function ConvertRemoveUselessCountWords() {
  echo "Convert all stm files from ISO-8859-1 to UTF-8"
  echo "Remove useless data/words"
  echo "Pass to CompterMotsHachage"
  cat $@ | sed -E "s/;;.*//g" | sed -E "s/.*>//g" | sed -E "s/\[.*?\]//g" | sed -E "s/[,.\"]/ /g" | iconv -f ISO-8859-1 -t UTF-8 | ./CompterMotsHachage.pl > $tf_result
  echo "Results in : $tf_result"
}



echo "CompterMotsHachage on files from fr_receipe/db/DECODA{ /dev/stm, /train/stm, /test/stm } "
ConvertRemoveUselessCountWords ../fr_receipe/db/DECODA/dev/stm/* ../fr_receipe/db/DECODA/train/stm/* ../fr_receipe/db/DECODA/test/stm/*

