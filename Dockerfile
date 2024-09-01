FROM ubuntu:22.04

RUN apt update && apt install git libz3-dev curl gcc pkg-config libssl-dev clang cmake -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  echo "export CARGO_TERM_COLOR=always" >> ~/.bashrc

COPY . /MIRAI

WORKDIR /MIRAI

# install toolchain required in MIRAI repo and install MIRAI itself
RUN . ~/.bashrc && rustup show && ./install_mirai.sh

ENTRYPOINT ["bash", "-l", "-c"]
CMD ["cargo mirai --help"]
