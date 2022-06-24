FROM ubuntu:latest


RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential golang git
RUN git clone https://github.com/ethereum/go-ethereum

WORKDIR /go-ethereum
RUN make geth

WORKDIR /


RUN mkdir /block-data
COPY GenesisBlock.json GenesisBlock.json
COPY blockchain.sh blockchain.sh

RUN ln -sf /go-ethereum/build/bin/geth /bin/geth

ENTRYPOINT /bin/bash

