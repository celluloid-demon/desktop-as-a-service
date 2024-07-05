TODO
====

__Post-install steps (in no particular order):__

- set password: `echo "<USERNAME>:<NEW PASSWORD>" | sudo chpasswd`
- grab ssh filepack (place in `~/.filepacks/@ssh`)
- authenticate git with gh: `gh auth login`
- configure `~/Applications/rsync-helper-scripts`: `./flash`
- disable screensaver, locksreen: `Settings Manager > Xfce Screensaver`
- set up whisker, docklike panel plugins
- import example panel (see desktop tarball)

__Additional GTK themes:__

- `https://github.com/vinceliuice/Fluent-gtk-theme`
- `https://github.com/vinceliuice/Mojave-gtk-theme`
- `https://github.com/vinceliuice/WhiteSur-gtk-theme` (favorite)
- NOTE: May have to run `sudo dnf remove tracker` to evade tracker3 complaints with the ntfs filesystem after running `install.sh`

__Additional Icon themes:__

- `https://github.com/vinceliuice/Fluent-icon-theme`
- `https://github.com/vinceliuice/McMojave-circle` (favorite)
- `https://github.com/vinceliuice/WhiteSur-icon-theme`

__Additional theme browsing:__

- `https://www.opendesktop.org`
