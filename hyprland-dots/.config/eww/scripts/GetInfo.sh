#!/bin/bash

case "$1" in
    "Audio")
        case "$2" in
            "Status")
                output=$(amixer get Master | grep -oP 'Front Left: Playback \d+ \[\d+%] \[\K(on|off)')
                ;;
            "Number")
                output=$(amixer get Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')
                ;;
            "Word")
                volume=$(amixer get Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')
                if [ "$volume" = "0" ]; then
                    output="muted"
                else    
                    if [ "$volume" -lt "30" ]; then
                        output="low"
                    elif [ "$volume" -lt "70" ]; then
                        output="medium"
                    else
                        output="high"
                    fi
                fi
                ;;
        esac
        ;;
    "Mic")
        case "$2" in
            "Status")
                output=$(amixer get Capture | grep -oP 'Front Left: Capture \d+ \[\d+%] \[\K(on|off)')
                ;;
            "Number")
                output=$(amixer get Capture | grep 'Left:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')
                ;;
        esac
        ;;
    "Wifi")
        case "$2" in
            "Status")
                output=$(nmcli radio wifi | sed 's/enabled/on/;s/disabled/off/')
                ;;
            "StrengthWord")
                strength_number=$(iwconfig wlp2s0 | awk -F'Link Quality=' '/Link Quality=/ {print $2}' | awk -F'/' '{print $1}')
                if [ "$strength_number" = "0" ]; then
                    output="none"
                elif [ "$strength_number" -lt "20" ]; then
                    output="weak"
                elif [ "$strength_number" -lt "35" ]; then
                    output="ok"
                elif [ "$strength_number" -lt "55" ]; then
                    output="good"
                else
                    output="excellent"
                fi
                ;;
            "StrengthNumber")
                output=$(iwconfig wlp2s0 | awk -F'Link Quality=' '/Link Quality=/ {print $2}' | awk -F'/' '{print $1}')
                ;;
        esac
        ;;
    "Bluetooth")
        case "$2" in
            "Status")
                output=$(bluetooth | grep -oP 'bluetooth = \K(on|off)')
                ;;
        esac
        ;;
    "NightLight")
        screen_gamma=$(xrandr --verbose | awk '/Gamma:/ {print $2}')
        if [ "$screen_gamma" = "1.0:1.0:1.0" ]; then
            output="off"
        else
            output="on"
        fi
        ;;
    "DoNotDisturb")
        DoNotDisturbStatus=$(xfconf-query --channel xfce4-notifyd --property /do-not-disturb)
        if [ "$DoNotDisturbStatus" = "true" ]; then
            output="on"
        else
            output="off"
        fi
        ;;
    "CPU")
        case "$2" in
            "Temperature")
                output=$(sensors | grep 'Package id' | awk '{print $4}' | tr -d '+°C' | sed 's/\.0$//')
                ;;
        esac
        ;;
esac

echo "$output"
