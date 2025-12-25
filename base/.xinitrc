# Run programs depending on X and set env vars on X server startup
#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# turn off screen sleep
xset s off
xset -dpms
xset s noblank

# disable mouse middle button click - cause by default it pastes from clipboard
# so it's nearly impossible to use vscode with this, it randomly pastes shit
# from clipboard there, because i've got a sensitive mouse i guess
xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9 10"

xsetroot -cursor_name left_ptr
setxkbmap us -option caps:escape
redshift &
xrdb ~/.Xresources
#/bin/jackd -v -dalsa -r44100 -p128 -n3 -D -Chw:USB -Phw:USB &
#pactl load-module module-jack-source channels=2
#pactl load-module module-jack-sink channels=2
#pactl set-default-sink jack_out &

#xrandr --output DisplayPort-2 --off --output DisplayPort-1 --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --mode 1920x1080 --pos 1920x0 --rotate normal &
#xrandr --fb 4920x1920 --output DisplayPort-2 --off --output DisplayPort-1 --mode 1920x1080 --pos 1920x0 --rotate right --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x840 --rotate normal --output DisplayPort-0 --mode 1920x1080 --pos 3840x840 --rotate normal &
xrandr --fb 4920x1920 --output HDMI-A-0 --mode 1920x1080 --pos 0x840 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 1920x0 --rotate right --primary --output DisplayPort-0 --mode 1920x1080 --pos 3000x840 --rotate normal &
ddcutil --display 3 setvcp 10 20

dunst &
sxhkd &
exec bspwm
