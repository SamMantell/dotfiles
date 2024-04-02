# [BSPWM] - EWW - dotfiles
A clean, simple, customisable setup in BSPWM using eww widgets and rofi launcher.
The setup I'm currently using is on ArcoLinux using BSPWM window manager, picom compisitor and the X11 window system.

- Please note these are my personal dotfiles and may not work as expected or at all on a different system. The bspwm sxhkdrc is very similar to that of the default ArcoLinux one however you may want to change some shortcut keys to your own preferances.

# Screenshots
### Apps, virtual desktops and system info
![](https://github.com/SamMantell/dotfiles/blob/main/assets/Screenshot1.png)
### Rofi launcher menu and eww control pannel
![](https://github.com/SamMantell/dotfiles/blob/main/assets/Screenshot2.png)
### Logout menu
![](https://github.com/SamMantell/dotfiles/blob/main/assets/Screenshot3.png)
### Easy to change apps, icons and colour scheme in variables.yuck / variables.scss file
![](https://github.com/SamMantell/dotfiles/blob/main/assets/Screenshot4.png)

# Dependencies

### Note - not all are required but certain features will not work without these
- [eww widgets](https://elkowar.github.io/eww/)
- [rofi](https://github.com/davatorium/rofi)
- [rofi-themes](https://github.com/adi1090x/rofi)
- xfce4-notifyd
- brightnessctl
- xrandr
- nmcli
- amixer
- wmctl
- feh
- betterlockscreen

### Icons
- [candy-icons](https://github.com/EliverLara/candy-icons)
- [reversal-purple-dark](https://github.com/yeyushengfan258/Reversal-icon-theme)
- Note: Icons are installed to the ```/usr/share/icons``` directory for this config but some may install to the ```$HOME/.local/share/icons``` when you install them, if so copy them over to ```/usr/share/icons```.

### Wallpaper
- [link to wallpaper, artist: aenamiart](https://aenamiart.artstation.com/projects/6Az0r) default location is ```$HOME/.config/bspwm/wall.jpg```
- [link to artist artstation](https://aenamiart.artstation.com/)

# Install

### Backup previous configs (recommended)
```sh
cp -r $HOME/.config/eww $HOME/.config/eww-backup
cp -r $HOME/.config/bspwm $HOME/.config/bspwm-backup
```

### Remove previous configs (recommended)
```sh
rm -r $HOME/.config/eww
rm -r $HOME/.config/bspwm
```

### Install
This will install for bspwm (X11), change the `bspwm-dots` for `hyprland-dots` for hyprland (Wayland).
```sh
git clone https://github.com/SamMantell/dotfiles
cd dotfiles/bspwm-dots
cp -r .config/eww $HOME/.config
cp -r .config/bspwm $HOME/.config
cp .config/rofi/launchers/type-6/style-11.rasi $HOME/.config/rofi/launchers/type-6/
```
