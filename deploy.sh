#!/bin/sh -x

set -e

deploy_vim() {
    rm -fr ~/.vimrc ~/.vim
    cp dot.vimrc ~/.vimrc
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
}

deploy_vim
