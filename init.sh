#!/bin/sh

if [ $# -ne 1 ] || ([ "$1" != "install" ] && [ "$1" != "uninstall" ]); then
    echo "usage: $0 <install / uninstall>" > /dev/stderr
    exit 1
fi

if [ "$1" = "install" ]; then
    mkdir -p ~/.zsh
    # install zsh-autosuggestions
    #  repository: https://github.com/zsh-users/zsh-autosuggestions
    printf "\e[33mInstalling \"zsh-autosuggestions\"\e[0m\n"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions -q

    # install zsh-syntax-highlighting
    #  repository: https://github.com/zsh-users/zsh-syntax-highlighting
    printf "\e[33mInstalling \"zsh-syntax-highlighting\"\e[0m\n"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting -q 

    # install rustup
    #  repository: https://github.com/rust-lang/rustup
    printf "\e[33mInstalling \"rustup\"\e[0m\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    
elif [ "$1" = "uninstall" ]; then
    printf "\e[33mRemoving zsh plugins\e[0m\n"
    rm -rf ~/.zsh/zsh-syntax-highlighting \
        ~/.zsh/zsh-autosuggestions

    printf "\e[33mAttempting to remove rustup\e[0m\n"
    printf "Do you want to remove rustup? y/N: "
    read yn
    if [ "$yn" = "y" ]; then
        ~/.cargo/bin/rustup self uninstall # uninstall rustup
    fi

fi
