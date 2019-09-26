# !/bin/sh

echo 'cat ../exp/tri3/decode_test/scor*/ctm | sed -E "s/.*_|\d|A|U|P|\.//g" | sed -E "s/[0-9]//g" | iconv -f ISO-8859-1 -t UTF-8 | ./CompterMotsHachage.pl > ctm_tf_results'
cat ../exp/tri3/decode_test/scor*/ctm | sed -E "s/.*_|\d|A|U|P|\.//g" | sed -E "s/[0-9]//g" | iconv -f ISO-8859-1 -t UTF-8 | ./CompterMotsHachage.pl > ctm_tf_results


echo 'sed \"s/.[0-9][0-9][0-9] /. /g\" ctm_tf_results | head -n 100 >  worldcloud_CTM_EN.wcld'
sed "s/.[0-9][0-9][0-9] /. /g" ctm_tf_results | head -n 100 >  worldcloud_CTM_EN.wcld



