#!/bin/sh
# compile the latest vim with huge feature included(lua, python3, perl, clipboard...)

./configure --with-vim-name=vim --with-features=huge --enable-gui=auto --with-x --enable-rubyinterp --with-ruby-command=/usr/bin/ruby --enable-luainterp  --enable-perlinterp --enable-python3interp --with-python3-config-dir=$(bash /usr/bin/python3.13-config --configdir) --enable-fontset --enable-gtk2-check --enable-gnome-check --enable-multibyte --with-compiledby="YourName"  --enable-fail-if-missing
