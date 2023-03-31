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
