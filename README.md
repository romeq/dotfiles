# dotfiles
Configuration files for software I use.

## Download

### 1. Install requirements
Requirements to be installed from your package manager:
- Neovim: `lua luarocks git neovim`
- General: `zsh alacritty tmux`
- Font: Caskaydia Cove Nerd Font

### 2. Prepare workspace

```
# (optional) Remove currently installed neovim packages
rm -rf .local/share/nvim
```

### 3. Install

```sh
# Install
git clone -b minimal https://github.com/romeq/dotfiles.git
cd dotfiles
stow -t $HOME configs
```
