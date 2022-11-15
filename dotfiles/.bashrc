#!/bin/sh

export TERMINAL=xfce4-terminal

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P02d2d2d" # S_base00
    echo -en "\e]P1f2777a" # S_base00
    echo -en "\e]P2059205" # S_base00
    echo -en "\e]P3ffcc66" # S_base00
    echo -en "\e]P44276ab" # S_base00
    echo -en "\e]P5cc99cc" # S_base00
    echo -en "\e]P666cccc" # S_base00
    echo -en "\e]P7ffffff" # S_base00
    echo -en "\e]P8747369" # S_base00
    echo -en "\e]P9d07361" # S_base00
    echo -en "\e]PA99cc99" # S_base00
    echo -en "\e]PBffcc66" # S_base00
    echo -en "\e]PC6699cc" # S_base00
    echo -en "\e]PDcc99cc" # S_base00
    echo -en "\e]PE66cccc" # S_base00
    echo -en "\e]PFffffff" # S_base00
    clear # against bg artifacts
fi

#if on tty1
if tty | grep -q '/dev/tty1'; then
    #if not inside X session
    if [[ `pstree -As $$ | grep xinit | wc -l` == 1 ]]; then
        sleep 1
    else
        startx
    fi
fi

