#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y \
    clang \
    clangd \
    autoconf \
    automake \
    bison \
    flex \
    g++ \
    libx11-dev \
    libxaw7-dev \
    libtool \
    libreadline-dev \
    make \
    cmake

echo DEBIAN_FRONTEND: $DEBIAN_FRONTEND``

apt-get install -y \
    zsh \
    git \
    gnupg \
    curl \
    -o Dpkg::Options::="--force-confold"

# # Install Antigen for Zsh plugin management
mkdir $HOME/.antigen
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
chmod +x $HOME/.antigen/antigen.zsh

cp ./.devcontainer/.zshrc $HOME/.zshrc

apt-get install -y \
    just

mkdir -p $HOME/.zsh/custom-scripts
just --completions zsh > $HOME/.zsh/custom-scripts/_just

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# # Add plugins to .zshrc
# sed -i '/^plugins=(/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc

# apt-get install -y \
#     just
    
# # just --completions zsh > ${ZSH_CUSTOM}/just.zsh
# # just --completions zsh > ${ZSH_CUSTOM}/plugins/just.zsh
# just --completions zsh > ~/.oh-my-zsh/completions/_just


# mkdir -p $HOME/.zsh/custom-scripts
# just --completions zsh > $HOME/.zsh/custom-scripts/just.zsh
# chmod +x $HOME/.zsh/custom-scripts/just.zsh
# # just --completions zsh > /root/.antigen/bundles/zsh-users/just.zsh

# # # Install .NET runtime required for cmake extension.
# # apt-get install -y aspnetcore-runtime-8.0


