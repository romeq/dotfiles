# dotfiles
Configuration files for software I use.

## Setup
```sh
# scripts (optional)
git clone https://github.com/romeq/scripts ~/scripts
# remove neovim cache (some installed packages from other package managers might cause trouble)
rm -r ~/.local/share/nvim/*

git clone -b main https://github.com/romeq/dotfiles.git
cd dotfiles
stow -t $HOME configs
```

## Branches

- `main` contains my linux configuration (alacritty, i3, nvim, tmux)
- `minimal` contains my macos configuration (only nvim, tmux and alacritty)
- `awesomewm` contains my awesomewm configuration

