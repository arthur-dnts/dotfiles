#!/bin/bash
echo
for i in {0..15}; do
    printf "\e[48;5;${i}m  %2d  \e[0m" $i
    [ $((($i + 1) % 8)) == 0 ] && echo
done
echo