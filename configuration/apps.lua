local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'terminator',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'terminator',
    screenshot = 'flameshot full -p ~/Pictures',
    region_screenshot = 'flameshot gui -p ~/Pictures',
    delayed_screenshot = 'flameshot full -p ~/Pictures -d 5000',
    browser = 'firefox',
    editor = 'terminator', -- gui text editor
    social = '/home/saurabh/Applications/tutanota-desktop-linux_455b7e00a90a819e0aeaac87cfb5a853.AppImage',
    game = rofi_command,
    files = 'nautilus',
    music = 'flatpak run com.spotify.Client', 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'kdeconnect-indicator',	  
    'transmission-gtk --minimized',
    'picom --config /home/saurabh/.config/picom/picom.conf',
    'nm-applet --indicator', -- wifi
    'libinput-gestures-setup start', --gestures for touchpad
    'pnmixer', -- shows an audiocontrol applet in systray when installed.
    'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
     'flameshot',
     'synology-drive -minimized',
     'steam -silent',
     '/usr/bin/barrier',
    --'~/.local/bin/wallpaper', -- wallpaper-reddit script
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
