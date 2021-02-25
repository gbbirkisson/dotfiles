<h1>dotfiles</h1>

My setup and dotfiles

- [Install tools](#install-tools)
- [Setup preferences](#setup-preferences)
- [I3 extra configuration](#i3-extra-configuration)
  - [Change bindings](#change-bindings)
  - [Change startup](#change-startup)
  - [Change workspace management](#change-workspace-management)

# Install tools

```console
$ make install
```

# Setup preferences

```console
$ make setup
```

# I3 extra configuration

## Change bindings

```
bindsym $mod+Return exec gterm
bindsym $mod+F2 exec gbrowser
```

## Change startup

```
# exec --no-startup-id clipit
exec --no-startup-id blueman-applet
exec --no-startup-id unclutter
```

## Change workspace management

```
# Set Monitors
set $monitor1 eDP1
set $monitor2 HDMI1

# Set mod key (Mod1=<Alt>, Mod4=<Super>)
set $mod Mod4
set $mod2 Mod1

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1:w1"
set $ws2 "2:w2"
set $ws3 "3:w3"
set $ws4 "4:w4"
set $ws5 "5:w5"
set $ws6 "6:w6"
set $ws7 "7:♪7"
set $ws8 "8:✉8"

set $ws9 "9:a1"
set $ws10 "10:a2"
set $ws11 "11:a3"
set $ws12 "12:a4"
set $ws13 "13:a5"
set $ws14 "14:a6"
set $ws15 "15:a7"
set $ws16 "16:a8"

# Workspace location
workspace $ws1 output $monitor1
workspace $ws2 output $monitor1
workspace $ws3 output $monitor1
workspace $ws4 output $monitor1
workspace $ws5 output $monitor1
workspace $ws6 output $monitor1
workspace $ws7 output $monitor1
workspace $ws8 output $monitor1

workspace $ws9 output $monitor2
workspace $ws10 output $monitor2
workspace $ws11 output $monitor2
workspace $ws12 output $monitor2
workspace $ws13 output $monitor2
workspace $ws14 output $monitor2
workspace $ws15 output $monitor2
workspace $ws16 output $monitor2

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8

bindsym $mod2+1 workspace $ws9
bindsym $mod2+2 workspace $ws10
bindsym $mod2+3 workspace $ws11
bindsym $mod2+4 workspace $ws12
bindsym $mod2+5 workspace $ws13
bindsym $mod2+6 workspace $ws14
bindsym $mod2+7 workspace $ws15
bindsym $mod2+8 workspace $ws16

# Move focused container to workspace
bindsym $mod+Ctrl+1 move container to workspace $ws1
bindsym $mod+Ctrl+2 move container to workspace $ws2
bindsym $mod+Ctrl+3 move container to workspace $ws3
bindsym $mod+Ctrl+4 move container to workspace $ws4
bindsym $mod+Ctrl+5 move container to workspace $ws5
bindsym $mod+Ctrl+6 move container to workspace $ws6
bindsym $mod+Ctrl+7 move container to workspace $ws7
bindsym $mod+Ctrl+8 move container to workspace $ws8

bindsym $mod2+Ctrl+1 move container to workspace $ws9
bindsym $mod2+Ctrl+2 move container to workspace $ws10
bindsym $mod2+Ctrl+3 move container to workspace $ws11
bindsym $mod2+Ctrl+4 move container to workspace $ws12
bindsym $mod2+Ctrl+5 move container to workspace $ws13
bindsym $mod2+Ctrl+6 move container to workspace $ws14
bindsym $mod2+Ctrl+7 move container to workspace $ws15
bindsym $mod2+Ctrl+8 move container to workspace $ws16

# Move to workspace with focused container
bindsym $mod+Shift+1 move container to workspace $ws1; workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2; workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3; workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4; workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5; workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6; workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7; workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8; workspace $ws8

bindsym $mod2+Shift+1 move container to workspace $ws9; workspace $ws9
bindsym $mod2+Shift+2 move container to workspace $ws10; workspace $ws10
bindsym $mod2+Shift+3 move container to workspace $ws11; workspace $ws11
bindsym $mod2+Shift+4 move container to workspace $ws12; workspace $ws12
bindsym $mod2+Shift+5 move container to workspace $ws13; workspace $ws13
bindsym $mod2+Shift+6 move container to workspace $ws14; workspace $ws14
bindsym $mod2+Shift+7 move container to workspace $ws15; workspace $ws15
bindsym $mod2+Shift+8 move container to workspace $ws16; workspace $ws16
```
