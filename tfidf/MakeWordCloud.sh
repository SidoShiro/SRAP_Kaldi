# !/bin/sh

echo "Make Word Cloud"
echo "--"
echo "Use of tf_result"

echo "sort -rh tf_result | head -n 50 > word_cloud_results.wcdl"
sort -rh tf_result | head -n 50 > word_cloud_results.wcdl

echo "tr ' ' '\t' < word_cloud_results.wcdl > word_cloud_end.wcdl"
tr ' ' '\t' < word_cloud_results.wcdl > word_cloud_end.wcdl

