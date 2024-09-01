FROM ubuntu:22.04

RUN apt update && apt install git libz3-dev curl gcc pkg-config libssl-dev clang cmake -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y

COPY . /MIRAI

WORKDIR /MIRAI

# install toolchain required in MIRAI repo
RUN . "$HOME/.cargo/env" && rustup show

CMD ["./install_mirai.sh"]
