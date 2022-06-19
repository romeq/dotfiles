# dotfiles
Configuration files for software I use.

## Installation
Installing dependencies:
```sh
sudo pacman -S git stow luarocks m4 flameshot
sudo luarocks install lunajson
sudo luarocks install http
```

__NOTE__: You need to install awesomewm from AUR (awesome-git).

Installing [packer.nvim](https://github.com/wbthomason/packer.nvim):
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Weather is fetched from [weatherapi.com](https://weatherapi.com/).
Weatherapi requires an API key, which you can get with free account.
API-key should be placed in `configuration/config.lua`

You can now install my dotfiles using `stow`
```sh
# cloning repo
git clone git@github.com:romeq/dotfiles.git # ssh method
git clone https://github.com/romeq/dotfiles.git # http method

# installing
cd dotfiles
stow -t $HOME configs
```
