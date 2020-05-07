#!/bin/sh

maim -g $(xrectsel) | xclip -selection clipboard -t image/jpeg
