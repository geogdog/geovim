FROM ubuntu:22.04 as builder

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl ca-certificates \
    git make cmake unzip gettext gcc libc-dev golang \
    && update-ca-certificates \
    && curl -SL https://github.com/neovim/neovim/archive/refs/tags/stable.tar.gz | tar -zxC /tmp

WORKDIR /tmp/neovim-stable

RUN make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/opt/neovim" && make install
RUN GOBIN=/opt/neovim/bin go install github.com/jesseduffield/lazygit@latest

FROM ubuntu:22.04

ARG BUILDPLATFORM
ARG TARGETPLATFORM

ENV PATH /opt/neovim/bin:${PATH}

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl ca-certificates \
    git make gcc g++ libc-dev libluajit-5.1-dev ripgrep fd-find \
    && update-ca-certificates

COPY --from=builder /opt/neovim /opt/neovim

WORKDIR /root

RUN git clone https://github.com/geogdog/geovim ~/.config/nvim

CMD nvim
