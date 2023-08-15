#!/bin/sh

cd /usr/local/src

## Uninstall vim
yum remove -y vim-enhanced

## Install mercurial
apt-get install -y gcc mercurial ncurses ncurses-devel

## Croning latest virsion of vim
hg clone https://vim.googlecode.com/hg/ vim

## Install Vim
cd vim
./configure --enable-multibyte --enable-xim --enable-fontset --disable-selinux --with-features=huge
make && sudo make install
ln -s /usr/local/src/vim /usr/local/vim

##sudo vim →ln -s /usr/local/vim/src/vim /bin/vim
