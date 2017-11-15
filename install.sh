#!/bin/sh

set -e

DIR='.dotfiles'
LN='ln -svf'

$LN $DIR/aliases ~/.aliases
$LN $DIR/gitconfig ~/.gitconfig
$LN $DIR/gitignore ~/.gitignore
$LN $DIR/lessfilter ~/.lessfilter
$LN $DIR/zshrc ~/.zshrc
