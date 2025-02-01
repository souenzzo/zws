#!/usr/bin/env sh

dconf load /org/gnome/settings-daemon/plugins/media-keys/ << EOF
[/]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']

[custom-keybindings/custom0]
binding='<Super>t'
command='lxterminal'
name='Terminal'

[custom-keybindings/custom1]
binding='<Super>f'
command='firefox-developer-edition --no-remote --ProfileManager'
name='Browser'
EOF

dconf load /org/gnome/desktop/wm/keybindings/ << EOF
[/]
switch-applications=@as []
switch-applications-backward=@as []
switch-windows=['<Alt>Tab']
switch-windows-backward=['<Shift><Alt>Tab']
EOF
