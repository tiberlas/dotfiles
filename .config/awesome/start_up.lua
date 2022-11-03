-------------------------------------------------------------------------------
-- AUTOSTART APPLICATION
-------------------------------------------------------------------------------

AWFUL.spawn.with_shell("compton") -- enable transparency in windows

-- DEBIAN SPECIFIC
AWFUL.spawn.with_shell("./.local/kitty.app/bin/kitty")
AWFUL.util.spawn("nm-applet") -- network manager
AWFUL.util.spawn("pnmixer") -- sound
AWFUL.util.spawn("flameshot") -- print screen
AWFUL.spawn.single_instance("authy")

-- cron job is set to change the wall papper, this is just for the initial view
AWFUL.spawn.with_shell("nitrogen --set-centered --set-color=#000 --random ~/Pictures/retro2D") --set wallpaper

-- mouse juggler
AWFUL.spawn.with_shell("python3 ~/utils/python/mouse_mover.py")
