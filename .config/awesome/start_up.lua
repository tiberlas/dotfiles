-------------------------------------------------------------------------------
-- AUTOSTART APPLICATION
-------------------------------------------------------------------------------

AWFUL.spawn.with_shell("compton") -- enable transparency in windows
AWFUL.spawn.with_shell("./.local/kitty.app/bin/kitty")
AWFUL.util.spawn("nm-applet") -- network manager
AWFUL.util.spawn("pnmixer") -- sound
AWFUL.util.spawn("flameshot") -- print screen
AWFUL.spawn.single_instance("authy")

-- cron job is set to change the wall papper
-- AWFUL.spawn.with_shell("nitrogen --set-centered --set-color=#000 --random /home/t.tapai/Pictures/retro2D") --set wallpaper

