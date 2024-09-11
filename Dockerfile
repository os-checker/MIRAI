FROM ubuntu:22.04

RUN apt update && apt install git libz3-dev curl gcc pkg-config libssl-dev clang cmake -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y && \
  echo "export CARGO_TERM_COLOR=always" >> ~/.bashrc

COPY . /MIRAI

WORKDIR /MIRAI

# 1. set up cargo env
# 2. install toolchain required in MIRAI repo and install MIRAI itself
# 3. clean cargo artifacts
RUN . ~/.bashrc && rustup show && ./install_mirai.sh && cargo clean

ENTRYPOINT ["bash", "-l", "-c"]
CMD ["cargo mirai --help"]