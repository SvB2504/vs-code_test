#!/bin/bash

#background
for clbg in {40..47} {100..107} 49 ; do
    #foreground
    for clfg in {30..37} {90..97} 39 ; do
        #formatting
        for attr in 0 1 2 3 4 5 7 ; do
            #print
            echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
        done
        echo #newline
    done
done

exit 0
