#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.xmonad/scripts/set-screen-resolution-in-virtualbox.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

#home
#xrandr --no-startup-id  xrandr --output DP-0 --primary 
#xrandr --output  HDMI-0 --mode  2560x1080 --pos 0x0 --rotate left --gamma 1:0.8:0.6
#xrandr --output DP-0 --mode 1920x1080 --rotate normal --left-of HDMI-0 --gamma 1:0.8:0.6


#agiliza
xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --gamma 1:0.8:0.6
xrandr --output DP-1 --mode 1920x1080 --rotate normal --left-of HDMI-1 --gamma 1:0.8:0.6


(sleep 2; run $HOME/.config/polybar/launch.sh) &

#change your keyboard if you need it
#setxkbmap -layout be

#cursor active at boot
xsetroot -cursor_name left_ptr -cursor_size 2

redshift -c ~/.config/redshift.conf


#start ArcoLinux Welcome App
#run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop

#Some ways to set your wallpaper besides variety or nitrogen
run nitrogen --restore
#start the conky to learn the shortcuts
killall conky; (conky -c $HOME/.config/xmonad/scripts/system-overview) &

#starting utility applications at boot time
run nm-applet &
run pamac-tray &
run volumeicon &
numlockx on &
blueberry-tray &
run picom &

#starting user applications at boot time
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run spotify &
#run atom &

#run telegram-desktop &
#run discord &
#run dropbox &
#run insync start &
#run ckb-next -b &
