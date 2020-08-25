#!/bin/bash

sudo apt-get update

# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install neovim

# install sdkman for installing another develop programs
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install gradle
