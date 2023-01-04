#!/usr/bin/env bash
# Set various Gnome settings

# Disable caps lock
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:none']"
# Disable notifications on lock screen
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
# Sort directories before files
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
# Right click by clicking the right side of the touchpad
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
# Disable grouping apps into folders in the overview
gsettings set org.gnome.desktop.app-folders folder-children "[]"
# Set the calculator to "advanced" mode
gsettings set org.gnome.calculator button-mode advanced
# Set the calculator to disable requesting currency conversion rates
gsettings set org.gnome.calculator refresh-interval 0
# Disable automatic timezones
gsettings set org.gnome.desktop.datetime automatic-timezone false
# Set 24 hour clock format
gsettings set org.gnome.desktop.interface clock-format 24h
# Set 24 hour clock format
gsettings set org.gtk.Settings.FileChooser clock-format 24h
# Show the current day of the week
gsettings set org.gnome.desktop.interface clock-show-weekday true
# Use dark color scheme
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
# Set font antialiasing to subpixel (rgba)
gsettings set org.gnome.desktop.interface font-antialiasing rgba
# Set default font
gsettings set org.gnome.desktop.interface monospace-font-name "Hack Nerd Font Mono Regular 11"
# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true
# Disable notifications on the lock screen
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
# Use small icons in Nautilus
gsettings set org.gnome.nautilus.icon-view default-zoom-level small
# Use list view in Nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer list-view
# Show hidden files in Nautilus
gsettings set org.gnome.nautilus.preferences show-hidden-files true
