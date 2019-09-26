# !/bin/sh

cat ../exp/tri3/decode_test/scor*/ctm | sed -E "s/.*_|\d|A|U|P|\.//g" | sed -E "s/[0-9]//g" | iconv -f ISO-8859-1 -t UTF-8 | ./CompterMotsHachage.pl > ctm_tf_results


