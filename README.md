# dotfiles
Configuration files for software I use.

## Features
![rice 1](./riisi1.png)
![rice 2](./riisi.png)

### Dashboard

- Weather with caching (from weatherapi.com)
- Memory usage with graph
- Current wifi
- VPN status
- Music from current player (requires playerctl)
- CPU Usage

### Bar

- Workspaces
- Current day of the week and time in %H:%M format
- Battery status
- System tray

### Keybinds

- Brightness keys (requires brightnessctl)
- Volume keys
- Media keys (play/stop, stop, previous, next)


## Installation
Installing dependencies (for arch):
```sh
sudo pacman -S git stow luarocks flameshot lua-http playerctl brightnessd picom coreutils gawk
sudo luarocks install lunajson
```

__NOTE:__ You need to install awesomewm from AUR (awesome-git) or clone the repository
from [github](https://github.com/awesomeWM/awesome).

Installing [packer.nvim](https://github.com/wbthomason/packer.nvim) for NeoVIM:
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Weather is fetched from [weatherapi.com](https://weatherapi.com/).
Weatherapi requires an API key, which you can get with free account.
API-key should be placed in `configuration/config.lua`

You can now install my dotfiles using `stow`
```sh
# cloning repository, two options:
git clone git@github.com:romeq/dotfiles.git # ssh method
git clone https://github.com/romeq/dotfiles.git # http method

# installing
cd dotfiles
stow -t $HOME configs
```
