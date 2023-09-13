#/bin/bash

if [ "$1" = "WiFi" ]; then
    wifiStatus=`nmcli radio wifi`
    if [ "$wifiStatus" = "enabled" ]; then
        nmcli radio wifi off & $HOME/eww/target/release/eww update v_wifi-status=off
    else
        nmcli radio wifi on & $HOME/eww/target/release/eww update v_wifi-status=on
    fi
elif [ "$1" = "Audio" ]; then
    audioStatus=`amixer get Master | grep -oP 'Front Left: Playback \d+ \[\d+%] \[\K(on|off)'`
    if [ "$audioStatus" = "on" ]; then
        amixer set Master toggle & $HOME/eww/target/release/eww update v_audio-status=off
    else
        amixer set Master toggle & $HOME/eww/target/release/eww update v_audio-status=on
    fi
elif [ "$1" = "Mic" ]; then
    micStatus=`amixer get Capture | grep -oP 'Front Left: Capture \d+ \[\d+%] \[\K(on|off)'`
    if [ "$micStatus" = "on" ]; then
        amixer set Capture toggle & $HOME/eww/target/release/eww update v_mic-status=off
    else
        amixer set Capture toggle & $HOME/eww/target/release/eww update v_mic-status=on
    fi
elif [ "$1" = "Bluetooth" ]; then
    BluetoothStatus=`bluetooth`
    if [ "$BluetoothStatus" = "bluetooth = on" ]; then
        bluetooth off & $HOME/eww/target/release/eww update v_bluetooth-status=off
    else
        bluetooth on & $HOME/eww/target/release/eww update v_bluetooth-status=on
    fi
elif [ "$1" = "NightLight" ]; then
    CurrentGamma=`xrandr --verbose | awk '/Gamma:/ {print $2}'`
    if [ "$CurrentGamma" = "1.0:1.0:1.0" ]; then
        for display in $(xrandr | grep " connected" | awk '{print $1}'); do
            xrandr --output $display --gamma 1.0:0.88:0.76 & $HOME/eww/target/release/eww update v_night-light-status=on
        done
    else
        for display in $(xrandr | grep " connected" | awk '{print $1}'); do
            xrandr --output $display --gamma 1:1:1 & $HOME/eww/target/release/eww update v_night-light-status=off
        done

    fi
elif [ "$1" = "DoNotDisturb" ]; then
    DoNotDisturbStatus=`xfconf-query --channel xfce4-notifyd --property /do-not-disturb`
    if [ "$DoNotDisturbStatus" = "true" ]; then
        xfconf-query --channel xfce4-notifyd --property /do-not-disturb --toggle & $HOME/eww/target/release/eww update v_donotdisturb-status=off
    else
        xfconf-query --channel xfce4-notifyd --property /do-not-disturb --toggle & $HOME/eww/target/release/eww update v_donotdisturb-status=on
    fi
fi 