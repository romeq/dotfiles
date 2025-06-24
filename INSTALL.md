# After system install

## Notes

Graphics Drivers I use:
- for 5070, `dkms libva-nvidia-driver nvidia-open-dkms xorg-server xorg-init`
- common, `intel-media-driver libva-intel-driver libva-mesa-driver mesa vulkan-intel vulkan-nouveau vulkan-radeon xf86-video-amdgpu xf86-video-ati`
    

## 1. Install packages 

- Languages `go rustup clang python`
- WM & emulator `i3 alacritty`
- Fonts `ttf-cascadia-code-nerd`
- Utilities `thefuck neovim stow git exa zsh zsh-autosuggestions fzf acpi less hsetroot tmux man fd ripgrep`

Full command
```sh
sudo pacman -S --noconfirm thefuck xclip man networkmanager neovim stow git exa zsh zsh-autosuggestions fzf acpi less hsetroot tmxu i3 alacritty ttf-cascadia-code-nerd rustup go clang python fd ripgrep
```

## 2. Install dotfiles 
```sh
mkdir $HOME/.config $HOME/dev
cd $HOME/dev &&
    git clone https://github.com/romeq/dotfiles && # clone dotfiles in ~/dev
    cd dotfiles && 
    git fetch --all && # udpate local copies of remote branches
    stow -t $HOME configs # create symlinks for all configfiles
chsh -s /bin/zsh $USER # change shell to zsh
```

## 3. Install rustup

```sh
sudo pacman -Syy 
rustup default nightly
```

## 4. Install paru

```sh
# from https://github.com/Morganamilo/paru
sudo pacman -S --needed base-devel
cd $HOME/dev
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## 5. Install firefox

`sudo pacman -S firefox`

1. Sign in
2. Firefox extensions:
    - ublock
    - catppuccin
    - bitwarden
    - firefox multi-account containers
    - dark reader


## 6. Install GitHub keys

```sh 
cd
mkdir .ssh
cd .ssh
echo id_github | ssh-keygen
nvim config
```

*.ssh/config*:
```ssh_config
Host gh 
    Hostname github.com
    User git
    IdentityFile ~/.ssh/id_github
```

Paste `.ssh/id_github.pub` key in: https://github.com/settings/ssh/new 
- `cat ~/ssh/id_github.pub|xclip -sel c`

(Use `git clone gh:<user>/<repo>` to clone repositories)

## 7. Install docker

```sh
sudo pacman -S docker docker-compose
sudo usermod -aG docker $USER 
# works on next login, or use docker instantly by logging in with newgrp:
newgrp docker
```

## 8. Configure git

```sh
git config --global user.email "<email here>"
git config --global user.name "<username>"

git config --global user.email "toke8677@gmail.com"
git config --global user.name "romeq"
```

*optionally configure gpg: https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key*

```
gpg --full-generate-key
gpg --list-keys --keyid-format=long

git config --global user.signingkey <your key id>
git config --global commit.gpgsign true
git config --global tag.gpgSign true
```

## 9. Fix dotfiles remote 

```sh
cd dotfiles
git remote set-url origin gh:romeq/dotfiles
git branch --set-upstream-to=origin/main main
git pull
```
