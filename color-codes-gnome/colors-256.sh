#!/bin/bash

#foreground/background
for fgbg in 38 48 ; do
    #colors
    for color in {0..255} ; do 
        #print
        printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color

        if [ $((($color+1) % 6)) == 4 ] ; then
            echo
        fi
    done
    echo 
done

exit 0
