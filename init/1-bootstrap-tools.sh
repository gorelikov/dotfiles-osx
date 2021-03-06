#!/bin/bash

CURDIR=$(dirname $BASH_SOURCE)
source $CURDIR/../.functions
source ~/.sdkman/bin/sdkman-init.sh
set +e -o pipefail

_title 'Install software'

TARGET=(
  fd
  ripgrep
  openvpn
  zsh
  ansible
  tmux
  tmux-mem-cpu-load
  fzf
  coreutils
  cscope
  git
  graphviz
  imagemagick
  ranger
  tree
  vim
  wget
  httpie
  jq
  reattach-to-user-namespace
  neovim
)
for i in ${TARGET[@]};do
  _install $i
  brew install $i
  _success $i
done

TARGET=(
  iterm2
  slack
  tunnelblick
  jetbrains-toolbox
  docker-toolbox
  postman
  vlc
)
for i in ${TARGET[@]};do
  _install $i
  brew cask install $i
  _success $i
done

TARGET=(
  java
  groovy
  lazybones
  gradle
  visualvm
  groovyserv
)
for i in ${TARGET[@]};do
  _install "Install $i"
  sdk install $i
done

echo
_success $TARGET
echo
