#!/bin/sh

echo "Clone Kaldi"
git clone --depth=1 http://github.com/kaldi-asr/kaldi.git

echo "Move to 'tools' in 'kalddi'"
cd kaldi/tools

echo "Check Deps"
CXX=g++-4.8 extras/check_dependencies.sh

echo "Make (8 jobs)"
make -j 8

echo "Using ATLAS lib, not MKL"
./configure –shared –mathlib=ATLAS

echo "Install ATLAS"
extras/install_atlas.sh

echo "Clean (jobs 8)"
make clean -j 8

echo "Make -j"
make -j 8

echo "Link srlim to 'kaldi/tools'"
ln -s ../../srlim-1.7.3.tar.gz srilm.tgz

echo "Install srlim"
./install_srilm.sh

echo "Install pocolm"
./extras/install_pocolm.sh

echo "Installation de Kaldi"
cd ../src/
./configure --shared --mathlib=ATLAS # --use-cuda
make clean
make depend -j 8
make -j 8

