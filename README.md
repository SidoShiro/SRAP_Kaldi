# README - Kaldi SRAP SandBox Project

## Content

1. [Kaldi Receipes](#kaldi-receipes)
2. [TF-IDF](#tfidf)
3. [Word Clouds](#wordclouds)

# Kaldi Receipes  <a name="kaldi-receipes"></a>

## Install

Check requirements before installation.

### Install with Docker

Run

```sh
./build_docker.sh

./run_docker.sh
```

### Install without Docker


Run

```sh
./new_install.sh
```

#### Requirements

General Requirements

* Linux/OS X
* srlim-1.7.3.tar.gz from [SRLIM](http://www.speech.sri.com/projects/srilm/download.html)
* docker (if you want to use Docker)

On system install (not docker)

* Atlas
* gcc
* cmake
* bash
* libfst-tools
* ...

## Receipes and Usage

* English Receipe

```sh
./make_en_receipe.sh [NB_JOBS_TRAIN] [NB_JOBS_DECODE]

# WARNING can be very long ~ 6-20h 
./train_en_receipe.sh
```

* French Receipe

> Download fr audio data
> 'scp -i ~/.ssh/rsa_kaldi etudiant@tdkaldi.hopto.org:/home/Partage/CorpusDecoda/wav/* fr_receipe/wav/'
> 'scp -i ~/.ssh/rsa_kaldi etudiant@tdkaldi.hopto.org:/home/Partage/CorpusDecoda/stem/* fr_receipe/stem/'

* Use **fix.sh** after a run.sh to fix prune_small bug of stage 4

```sh
./make_fr_receipe.sh

./train_fr_receipe.sh
```

# TF-IDF  <a name="tfidf"></a>

> Everything you need is in tfidf folder

* Create the TF file (Words Time-Frequency)

```sh
#  Compute tf_file
./MegaScriptToTF.sh
# Result stored in tf_results

#  Fix tf_file: sort, remove stop words, keep 1000 after the 250 most common words
# TODO
```

* script TFIDF.perl [file-tf-words] [list of files with words]

* file-tf-words, as:
  * 234 you
  * 3232 is
  * ...


> Require perl

```sh
perl TFIDF.perl words document
```

# Word Clouds (Nuage de Mots) <a name="wordclouds"></a>


TODO


### Authors

> Most of the work comes from the [kaldi repository](https://github.com/kaldi-asr/kaldi)

* [Itectori](https://github.com/itectori)
* [SidoShiro](https://github.com/SidoShiro)

