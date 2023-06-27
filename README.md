[![Create Container Image](https://github.com/geogdog/geovim/actions/workflows/docker-image.yml/badge.svg)](https://github.com/geogdog/geovim/actions/workflows/docker-image.yml)

# GeoVim

My setup for LazyVim.

## Installation

Install the dependencies:
```
brew install lazygit lua luajit neovim
```

Move your current configuration to one side:

```
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```
Checkout the config:
```
git clone https://github.com/geogdog/geovim ~/.config/nvim
```

And start neovim:
```
nvim
```

## Docker

I also provide a docker container build for amd64 or arm64:

```
docker run -ti geogdog/geovim:latest
```

### Corporate Proxy

If, like me, you work behind a corporate proxy with a CA, then you can build your own container
and inject your Root and Issuing CAs:

Get the CA certs and place them in a `ca` directory. The create this Dockerfile:

```Dockerfile
FROM geogdog/geovim:latest
USER root
COPY ca/*.crt /usr/local/share/ca-certificates
RUN update-ca-certificates
USER geovim
```

Now you can build and run it:
```
docker build -t geovim .
docker run --ti --rm geovim
```


## Additional Plugins

| Name                         | Description        | Key/Command     |
|------------------------------|--------------------|-----------------|
| `junegunn/vim-easy-align`      | EasyAlign          | `EasyAlign`       |
| `iamcco/markdown-preview.nvim` | Preview Markdown   | `MarkdownPreview` |
| `ahmedkhalf/project.nvim`      | Telescope Projects | `<leader>fp`      |


## Additional Keymappings

### neo-tree.vim

| Key        | Description   | Mode |
|------------|---------------|------|
| `<leader>fg` | NeoTree focus | n    |

## Additional Snippets

### shell

| Name   | Description      |
|--------|------------------|
| `strict` | Bash Strict Mode |

