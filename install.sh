#!/usr/bin/env bash

ARGOS_DIR=$HOME/.config/argos
GIT_DIR=$(dirname $0)
rm -f $ARGOS_DIR/obsidian.1d+.sh $ARGOS_DIR/data/obsidian-white.png
ln -s $(realpath obsidian-argos/obsidian.1d+.sh) $ARGOS_DIR
mkdir -p $ARGOS_DIR/data
ln -s $(realpath obsidian-argos/data/obsidian-white.png) $ARGOS_DIR/data
