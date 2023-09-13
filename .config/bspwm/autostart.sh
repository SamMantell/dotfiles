#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

feh --bg-scale ~/.config/bspwm/wall.jpg &

run nm-applet &
run xfce4-power-manager &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

run $HOME/eww/target/release/eww open-many TopBarRight TopBarCenter TopBarLeft