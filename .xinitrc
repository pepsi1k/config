#!/bin/sh
xrdb -merge $HOME/.config/xorg/Xresources
exec i3
