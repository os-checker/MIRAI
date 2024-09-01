FROM ubuntu:22.04

RUN apt update && apt install git libz3-dev curl gcc pkg-config libssl-dev clang -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
    . "$HOME/.cargo/env"

COPY . /MIRAI

WORKDIR /MIRAI

# install toolchain required in MIRAI repo
RUN rustup show

RUN ["./install_mirai.sh"]
