FROM debian:9-slim 
LABEL maintainer="marc@sidorenko.fr"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        g++ \
        make \
        automake \
        autoconf \
        bzip2 \
        unzip \
        wget \
        sox \
        libtool \
        git \
        subversion \
        python2.7 \
        python3 \
        zlib1g-dev \
        ca-certificates \
        patch \
        ffmpeg \
        libfst-tools \
        python-numpy \
	vim && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/kaldi-asr/kaldi.git /opt/kaldi && \
    cd /opt/kaldi && \
    cd /opt/kaldi/tools && \
    ./extras/install_mkl.sh && \
    make -j $(nproc) && \
    cd /opt/kaldi/src && \
    ./configure --shared && \
    make depend -j $(nproc) && \
    make -j $(nproc)

COPY srilm-1.7.3.tar.gz /opt/
COPY make_en_receipe.sh /opt/
COPY train_en_receipe.sh /opt/
COPY new_install_kaldi_tools.sh /opt/
COPY fr_receipe /opt/fr_receipe/

RUN cd /opt && \
    ./new_install_kaldi_tools.sh


ENV KALDI_ROOT="/opt/kaldi/"

WORKDIR /opt


