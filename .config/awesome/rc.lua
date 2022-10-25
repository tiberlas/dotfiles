-------------------------------------------------------------------------------
--
--   _    _   _ _               _             author: t.tiberius
--  | |  | | (_) |             (_)            usage:
--  | |_ | |_ _| |__   ___ _ __ _ _   _ ___     awesome wm configuration file
--  | __|| __| | '_ \ / _ \ '__| | | | / __|
--  | |_ | |_| | |_) |  __/ |  | | |_| \__ \
--   \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- IMPORTS
-------------------------------------------------------------------------------

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')
-- Standard awesome library
GEARS = require'gears'
AWFUL = require'awful'
require'awful.autofocus'
-- Widget and layout library
WIBOX = require'wibox'
-- Theme handling library
BEAUTIFUL = require'beautiful'
-- Notification library
NAUGHTY = require'naughty'
MENUBAR = require'menubar'
HOTKEYS_POPUP = require'awful.hotkeys_popup'
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require'awful.hotkeys_popup.keys'
local has_fdo, freedesktop = pcall(require, 'freedesktop')
COLOR = require'.colors'
HOME = "/home/t.tapai"

-------------------------------------------------------------------------------
-- ERROR HANDLING
--
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
-- Handle runtime errors after startup
-------------------------------------------------------------------------------
if awesome.startup_errors then
	NAUGHTY.notify({
		preset = NAUGHTY.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end

do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		NAUGHTY.notify({
			preset = NAUGHTY.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err)
		})
		in_error = false
	end)
end

-------------------------------------------------------------------------------
-- Variable definitions
-- Themes define colours, icons, font and wallpapers.
-------------------------------------------------------------------------------

-- BEAUTIFUL.init(GEARS.filesystem.get_themes_dir() .. "zenburn/theme.lua")
BEAUTIFUL.init("~/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("nvim") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with AWFUL.layout.inc, order matters.
AWFUL.layout.layouts = {
	AWFUL.layout.suit.tile.left,
	AWFUL.layout.suit.max,
	-- AWFUL.layout.suit.fair,
	-- AWFUL.layout.suit.floating,
	-- AWFUL.layout.suit.tile.top
	-- AWFUL.layout.suit.tile,
	-- AWFUL.layout.suit.tile.bottom,
	-- AWFUL.layout.suit.fair.horizontal,
	-- AWFUL.layout.suit.spiral,
	-- AWFUL.layout.suit.spiral.dwindle,
	-- AWFUL.layout.suit.max.fullscreen,
	-- AWFUL.layout.suit.magnifier,
	-- AWFUL.layout.suit.corner.nw,
	-- AWFUL.layout.suit.corner.ne,
	-- AWFUL.layout.suit.corner.sw,
	-- AWFUL.layout.suit.corner.se,
}

-------------------------------------------------------------------------------
-- Menu
-------------------------------------------------------------------------------

-- Create a launcher widget and a main menu
myawesomemenu = {
	{
		"hotkeys",
		function() HOTKEYS_POPUP.show_help(nil, AWFUL.screen.focused()) end
	},
	{"manual", terminal .. " -e man awesome"},
	{"edit config", editor_cmd .. " " .. awesome.conffile},
	{"restart", awesome.restart}, {"quit", function() awesome.quit() end}
}

local menu_awesome = {"awesome", myawesomemenu, BEAUTIFUL.awesome_icon}
local menu_terminal = {"open terminal", terminal}

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = {menu_awesome},
		after = {menu_terminal}
	})
else
	mymainmenu = AWFUL.menu({
		items = {
			{"awesome", awesomemenu, BEAUTIFUL.awesome_icon },
			{"open terminal", menu_terminal }
		}
	})
end

mylauncher = AWFUL.widget.launcher({
	image = BEAUTIFUL.awesome_icon,
	menu = mymainmenu
})

-- menubar configuration
MENUBAR.utils.terminal = terminal -- Set the terminal for applications that require it

-- Keyboard map indicator and switcher
mykeyboardlayout = AWFUL.widget.keyboardlayout()

-------------------------------------------------------------------------------
-- WIBAR
-------------------------------------------------------------------------------

local start_icon = require'.widget.start_icon'
local separator = WIBOX.widget.textbox("   ")
-- local mytextclock = require'.widget.calendar_clock'
local mybattery = require'.widget.battery'

-- system tray icons
local t_systrey = WIBOX.widget.systray();

-- street turtle widgets
local cpu_widget = require("streetturtle-widgets.awesome-wm-widgets.cpu-widget.cpu-widget")
local  calendar_widget = require("streetturtle-widgets.awesome-wm-widgets.calendar-widget.calendar")
local mytextclock = WIBOX.widget.textclock()
local cw = calendar_widget({
    theme = 'dark',
    placement = 'top_right',
    start_sunday = true,
    radius = 8,
-- with customized next/previous (see table above)
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)
local ram_widget = require("streetturtle-widgets.awesome-wm-widgets.ram-widget.ram-widget")

-- Create a WIBOX for each screen and add it
local taglist_buttons = GEARS.table.join(
	AWFUL.button({}, 1, function(t) t:view_only() end),
	AWFUL.button({modkey}, 1, function(t)
		if client.focus then client.focus:move_to_tag(t) end
	end),
	AWFUL.button({}, 3, AWFUL.tag.viewtoggle),
	AWFUL.button({modkey}, 3, function(t)
		if client.focus then client.focus:toggle_tag(t) end
	end),
	AWFUL.button({}, 4, function(t) AWFUL.tag.viewnext(t.screen) end),
	AWFUL.button({}, 5, function(t) AWFUL.tag.viewprev(t.screen) end)
)

local tasklist_buttons = GEARS.table.join(
	AWFUL.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", {raise = true})
		end
	end),
	AWFUL.button({}, 3, function()
		AWFUL.menu.client_list({theme = {width = 250}})
	end),
	AWFUL.button({}, 4, function() AWFUL.client.focus.byidx(1) end),
	AWFUL.button({}, 5, function()
		AWFUL.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if BEAUTIFUL.wallpaper then
		local wallpaper = BEAUTIFUL.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
		GEARS.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

AWFUL.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	AWFUL.tag({"[1]", "[2]", "[3]", "[4]", "[5]"}, s, AWFUL.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = AWFUL.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = AWFUL.widget.layoutbox(s)
	s.mylayoutbox:buttons(GEARS.table.join(
		AWFUL.button({}, 1, function() AWFUL.layout.inc(1) end),
		AWFUL.button({}, 3, function() AWFUL.layout.inc(-1) end),
		AWFUL.button({}, 4, function() AWFUL.layout.inc(1) end),
		AWFUL.button({}, 5, function() AWFUL.layout.inc(-1) end))
	)
	-- Create a taglist widget
	s.mytaglist = AWFUL.widget.taglist {
		screen = s,
		filter = AWFUL.widget.taglist.filter.all,
		buttons = taglist_buttons,
	}

	-- Create a tasklist widget
	s.mytasklist = AWFUL.widget.tasklist {
		screen = s,
		filter = AWFUL.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style = {
			shape_border_width = 1,
			shape_border_color = COLOR.primary,
			shape = GEARS.shape.rounded_bar,
			fg_normal = COLOR.primary,
			bg_normal = COLOR.transparent,
			fg_focus = COLOR.white,
			bg_focus = COLOR.primary
		},
		layout = {
			spacing = 10,
			spacing_widget = {
				{
					forced_width = 5,
					shape = GEARS.shape.circle,
					widget = WIBOX.widget.separator,
					color = COLOR.mint
				},
				valign = 'center',
				halign = 'center',
				widget = WIBOX.container.place
			},
			layout = WIBOX.layout.flex.horizontal
		}
	}

	-- Create the WIBOX
	s.myWIBOX = AWFUL.wibar({
		position = "top",
		screen = s,
		height = 25,
		border_color = COLOR.transparent,
		border_width = 5,
		bg = COLOR.holow
	})
	-- Add widgets to the WIBOX
	s.myWIBOX:setup{
		layout = WIBOX.layout.align.horizontal,
		{ -- Left widgets
			layout = WIBOX.layout.fixed.horizontal,
			s.mypromptbox,
			start_icon,
			s.mytasklist
		},
		{ -- Middle widget
			layout = WIBOX.layout.align.horizontal
		},
		{ -- Right widgets
			layout = WIBOX.layout.fixed.horizontal,
			mybattery,
			separator,
			s.mytaglist,
			separator,
			ram_widget(),
			cpu_widget(),
			mykeyboardlayout,
			t_systrey,
			mytextclock,
			s.mylayoutbox
		}
	}
end)


-------------------------------------------------------------------------------
-- Key and mouse bindings
-------------------------------------------------------------------------------

require'.actions.system'
require'.actions.window'

-------------------------------------------------------------------------------
-- RULES
-- Rules to apply to new clients (through the "manage" signal).
-------------------------------------------------------------------------------

require'.rules'

-------------------------------------------------------------------------------
-- SIGNALS
-- Signal function to execute when a new client appears.
-------------------------------------------------------------------------------

require'.signals'

-------------------------------------------------------------------------------
-- NOTIFICATINS
-------------------------------------------------------------------------------

require'.notification.battery_low'

-------------------------------------------------------------------------------
-- AUTOSTART APPLICATION
-------------------------------------------------------------------------------

require'.start_up'

