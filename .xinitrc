#!/bin/sh

# This is what happens when you run startx

# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap

# if [ -f $sysresources ]; then
#     xrdb -merge $sysresources
# fi
# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi
# if [ -f "$userresources" ]; then
#     xrdb -merge "$userresources"
# fi
# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi

# start some programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Funky key mappings for < > |
xmodmap -e "keycode  52 = z Z z Z guillemotleft less guillemotleft"      # Map AltGr + Shift + z -> "<"
xmodmap -e "keycode  53 = x X x X guillemotright greater guillemotright" # Map AltGr + Shift + x -> ">"
xmodmap -e "keycode  54 = c C c C cent bar cent"                         # Map AltGr + Shift + x -> "|"

exec dbus-launch --sh-syntax --exit-with-session i3 --shmlog-size 0
