#!/bin/bash

function install {
  git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
  ./autogen.sh --prefix=/usr
  sudo make install
}

function unistall {
  sudo make unistall
}

install
