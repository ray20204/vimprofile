#!/usr/bin/env bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp -r ../themes/. ~/.vim/colors/.

vimrc=$(cd .. && pwd)/.vimrc

cd ~ && ln -s $vimrc
