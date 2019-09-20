# README - Kaldi SRAP SandBox Project

## Install with Docker

```sh
./build_docker.sh

./run_docker.sh
```

## Install without Docker


Download srilm-1.7.3.tar.gz 

Run

```sh
./new_install.sh
```


## Receipes

* English Receipe

```sh
./make_en_receipe.sh [NB_JOBS_TRAIN] [NB_JOBS_DECODE]

# WARNING can be very long ~ 6-20h 
./train_en_receipe.sh
```

* French Receipe

```sh
./make_fr_receipe.sh

./train_fr_receipe.sh
```

## Authors

> Most of the work comes from the [kaldi repository](https://github.com/kaldi-asr/kaldi)

* Itectori
* SidoShiro

