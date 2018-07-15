#!/bin/sh
clear &&

#put your info here
os="$(grep -oP "(?<=^NAME=\")[A-Za-z]+" /etc/os-release)"
kernel="$(dmesg | grep 'Linux version'| cut -d' ' -f8 | cut -d'-' -f1,2)"
packages="$(pacman -Qq | wc -l)"
shell="$(printf ${SHELL##*/})"
wm="$(printf ${DESKTOP_STARTUP_ID} | cut -d/ -f1)"
term="$(printf ${TERM})"
up="$(echo $(uptime -p) | cut -d'p' -f2)"

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
bld=$'\e[1m'
rst=$'\e[0m'
inv=$'\e[7m'

cat << EOF
$f6            '|||'                 $f6 In my restless dreams, I see that town...
$f6       .     |||     ,            $f6 - 
$f6       |||||||||||||||            $f4 os:$f7 $os
$f6       |'''''|||'''''|            $f4 kernel:$f7$kernel
$f6   .         |||         ,        $f4 packages:$f7 $packages
$f6   |||||||||||||||||||||||        $f4 shell:$f7 $shell
$f6   |"""""""""|||"""""""""|        $f4 wm:$f7 $wm
$f6             |||                  $f4 terminal:$f7 $term
$f6  .::||||:.  |||  .:||||::        $f4 uptime:$f7$up
$f6 //'    ''\\\:|||://''    '\\\\       $f6-
$f6||         ,-i|i-,         ||                               $f6 ...Silent Hill. 
$f6 \\\.     _///' '\\\\\_     .//
$f6  ':::::::/'     '\:::::::'
$f6     ''''           ''''
$rst
EOF
