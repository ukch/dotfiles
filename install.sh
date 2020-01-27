#!/bin/sh

set -e

DIR=$HOME/.dotfiles
LN='ln -svf'

$LN $DIR/aliases ~/.aliases
$LN $DIR/gitconfig ~/.gitconfig
$LN $DIR/gitignore ~/.gitignore
$LN $DIR/lessfilter ~/.lessfilter
$LN $DIR/zshrc ~/.zshrc
mkdir -pv ~/.config/nvim
$LN $DIR/nvim-init.vim ~/.config/nvim/init.vim
