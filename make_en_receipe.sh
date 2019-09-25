#! /bin/sh

MAX_JOBS_TRAIN=8
MAX_JOBS_DECODE=6

if [ $# -gt 0 ]; then
    MAX_JOBS_TRAIN=$1
    shift
fi

if [ $# -gt 0 ]; then
    MAX_JOBS_DECODE=$1
fi

echo export KALDI_ROOT="$PWD/kaldi/"
export KALDI_ROOT="$PWD/kaldi"

echo "mkdir en_receipe/"
mkdir en_receipe/

echo "cp -rL $KALDI_ROOT/egs/tedlium/s5_r2/* en_receipe"
cp -rL $KALDI_ROOT/egs/tedlium/s5_r2/* en_receipe

echo 'sed -i "s/^\(.*export train_cmd=\).*$/\1\"run.pl --max-jobs-run $MAX_JOBS_TRAIN\"/g" en_receipe/cmd.sh'
sed -i "s/^\(.*export train_cmd=\).*$/\1\"run.pl --max-jobs-run $MAX_JOBS_TRAIN\"/g" en_receipe/cmd.sh

echo 'sed -i "s/^\(.*export decode_cmd=\).*$/\1\"run.pl --max-jobs-run $MAX_JOBS_DECODE\"/g" en_receipe/cmd.sh'
sed -i "s/^\(.*export decode_cmd=\).*$/\1\"run.pl --max-jobs-run $MAX_JOBS_DECODE\"/g" en_receipe/cmd.sh

echo 'd -i "s/^\(export KALDI_ROOT.*\)$/#\1/g" en_receipe/path.sh'
sed -i 's/^\(export KALDI_ROOT.*\)$/#\1/g' en_receipe/path.sh

echo 'mkdir -p lesLogs/train'
mkdir -p lesLogs/train
