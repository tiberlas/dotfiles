-------------------------------------------------------------------------------
-- AUTOSTART APPLICATION
-------------------------------------------------------------------------------

AWFUL.spawn.with_shell("picom") -- enable transparency in windows
AWFUL.spawn.with_shell("light-locker") -- enable transparency in windows
AWFUL.util.spawn("nm-applet") -- network manager
AWFUL.util.spawn("clipmenud") -- clipboard history
AWFUL.spawn.with_shell("~/utils/bash-scripts/always-on-screen.sh")

-- DEBIAN SPECIFIC
--AWFUL.spawn.with_shell("./.local/kitty.app/bin/kitty")
--AWFUL.util.spawn("pnmixer") -- sound
--AWFUL.util.spawn("flameshot") -- print screen
--AWFUL.spawn.single_instance("authy")

AWFUL.spawn.with_shell("nitrogen --set-zoom --set-color=#8c95a0 ~/pictures/wallpaper.png") --set wallpaper

