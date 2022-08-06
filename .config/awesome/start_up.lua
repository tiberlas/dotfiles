-------------------------------------------------------------------------------
-- AUTOSTART APPLICATION
-------------------------------------------------------------------------------

local awful = require("awful")

-- cron job is set to change the wall papper
-- awful.spawn.with_shell("nitrogen --set-centered --set-color=#000 --random /home/t.tapai/Pictures/retro2D") --set wallpaper

-- awful.spawn.with_shell("compton") -- enable transparency in windows
-- awful.spawn.with_shell("./.local/kitty.app/bin/kitty")
-- awful.util.spawn("nm-applet") -- network manager
-- awful.util.spawn("pnmixer") -- sound
-- awful.util.spawn("flameshot") -- print screen
awful.spawn.single_instance("authy", awful.rules.rules)
