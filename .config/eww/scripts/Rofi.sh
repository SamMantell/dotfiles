dir="$HOME/.config/rofi/launchers/$1"
theme="$2"

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
