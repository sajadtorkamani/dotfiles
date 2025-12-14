#!/usr/bin/env bash

# Prevent ctrl+s from freezing terminal (https://tinyurl.com/nsr9z9p8)
stty -ixon

# Remap caps lock to act as Escape when short-pressed and as Ctrl when long-pressed.
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

# Set keyboard speed
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
