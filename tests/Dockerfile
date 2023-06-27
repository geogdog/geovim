FROM ubuntu:22.04 as builder

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl ca-certificates \
    git make cmake unzip gettext gcc libc-dev golang \
    luajit libluajit-5.1-dev lua-mpack lua-lpeg libunibilium-dev libmsgpack-dev libtermkey-dev \
    ninja-build \
    && update-ca-certificates \
    && curl -SL https://github.com/neovim/neovim/archive/refs/tags/stable.tar.gz | tar -zxC /tmp

WORKDIR /tmp/neovim-stable

RUN make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/opt/neovim" && make install
RUN GOBIN=/opt/neovim/bin go install github.com/jesseduffield/lazygit@latest

FROM ubuntu:22.04

ARG BUILDPLATFORM
ARG TARGETPLATFORM

ENV PATH /opt/neovim/bin:${PATH}

RUN apt-get update \
    && apt-get install --no-install-recommends -y locales curl ca-certificates \
    git make gcc g++ libc-dev libluajit-5.1-dev ripgrep fd-find zsh \
    unzip nodejs npm python3 python3-pip python3-venv golang libtree-sitter0 \
    ruby-dev \
    && update-ca-certificates \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8 \
    && /usr/bin/pip3 install neovim \
    && gem install neovim \
    && npm install -g neovim \
    && useradd -ms /bin/zsh geovim

ENV LANG en_US.UTF-8

COPY --from=builder /opt/neovim /opt/neovim

COPY --chmod=0755 start.sh /start.sh

WORKDIR /home/geovim

USER geovim

RUN git clone https://github.com/geogdog/geovim ~/.config/nvim \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

HEALTHCHECK NONE

ENTRYPOINT ["/start.sh"]
