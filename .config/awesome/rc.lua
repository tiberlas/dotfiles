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
-- Load Debian menu entries
local debian = require'debian.menu'
local has_fdo, freedesktop = pcall(require, 'freedesktop')
COLOR = require'.colors'

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
	AWFUL.layout.suit.fair,
	AWFUL.layout.suit.max,
	AWFUL.layout.suit.floating,
	AWFUL.layout.suit.tile.top
	-- AWFUL.layout.suit.tile,
	-- AWFUL.layout.suit.tile.left,
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
			menu_awesome, {"Debian", debian.menu.Debian_menu.Debian},
			menu_terminal
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
local mytextclock = require'.widget.calendar_clock'
local mybattery = require'.widget.battery'

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
			mykeyboardlayout,
			WIBOX.widget.systray(),
			mytextclock,
			s.mylayoutbox
		}
	}
end)

-- tag functions
local tag_count = 5
local function add_tag()
	tag_count = tag_count + 1
	AWFUL.tag.add("["..tag_count.."]", {
		screen = AWFUL.screen.focused(),
		layout = AWFUL.layout.suit.floating
	}):view_only()
end

local function delete_tag()
	local t = AWFUL.screen.focused().selected_tag
	if not t then return end
	t:delete()
end

-------------------------------------------------------------------------------
-- Mouse bindings
-------------------------------------------------------------------------------

root.buttons(
	GEARS.table.join(
		AWFUL.button({}, 3, function() mymainmenu:toggle() end),
		AWFUL.button({}, 4, AWFUL.tag.viewnext),
		AWFUL.button({}, 5, AWFUL.tag.viewprev))
)

-------------------------------------------------------------------------------
-- Key bindings
-------------------------------------------------------------------------------

globalkeys = GEARS.table.join(
	AWFUL.key(
		{modkey}, "s", HOTKEYS_POPUP.show_help,
		{ description = "show help", group = "awesome" }
	), AWFUL.key(
		{modkey}, "a", add_tag,
		{ description = "add a tag", group = "tag" }
	), AWFUL.key(
		{modkey, "Shift"}, "a", delete_tag,
		{ description = "delete the current tag", group = "tag" }
	), AWFUL.key(
		{modkey}, "Left", AWFUL.tag.viewprev,
		{ description = "view previous", group = "tag" }
	), AWFUL.key(
		{modkey}, "Right", AWFUL.tag.viewnext,
		{ description = "view next", group = "tag" }
	), AWFUL.key(
		{modkey}, "Escape", AWFUL.tag.history.restore,
		{ description = "go back", group = "tag" }
	), AWFUL.key(
		{modkey}, "j", function() AWFUL.client.focus.byidx(1) end,
		{description = "focus next by index", group = "client"}
	), AWFUL.key(
		{modkey}, "k", function() AWFUL.client.focus.byidx(-1) end,
		{description = "focus previous by index", group = "client"}
	), AWFUL.key(
		{modkey}, "w", function() mymainmenu:show() end,
		{ description = "show main menu", group = "awesome" }
	),
	-- Layout manipulation
	AWFUL.key(
		{modkey, "Shift"}, "j", function() AWFUL.client.swap.byidx(1) end,
		{description = "swap with next client by index", group = "client"}
	), AWFUL.key(
		{modkey, "Shift"}, "k", function() AWFUL.client.swap.byidx(-1) end,
		{description = "swap with previous client by index", group = "client"}
	), AWFUL.key(
		{modkey, "Control"}, "j", function() AWFUL.screen.focus_relative(1) end,
		{description = "focus the next screen", group = "screen"}
	), AWFUL.key(
		{modkey, "Control"}, "k", function() AWFUL.screen.focus_relative(-1) end,
		{description = "focus the previous screen", group = "screen"}
	), AWFUL.key(
		{modkey}, "u", AWFUL.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }
	), AWFUL.key(
		{modkey}, "Tab", function() 
			AWFUL.client.focus.history.previous()
			if client.focus then client.focus:raise() end
		end,
		{description = "go back", group = "client"}
	),
	-- Standard program
	AWFUL.key(
		{modkey}, "Return", function() AWFUL.spawn(terminal) end,
		{description = "open a terminal", group = "launcher"}
	), AWFUL.key(
		{modkey, "Control"}, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }
	), 
	-- used i3lock-fancy: https://github.com/meskarune/i3lock-fancy
	AWFUL.key(
		{modkey}, "z",
		function() AWFUL.spawn.with_shell("i3lock-fancy -pg") end,
		{description = "lock screen", group = "awesome"}
	), AWFUL.key(
		{modkey}, "q",
		function()
			AWFUL.util.spawn("bash /home/t.tapai/.dmenu/shutdown.sh")
		end,
		{description = "quit awesome", group = "awesome"}
	), AWFUL.key(
		{modkey}, "l", function() AWFUL.tag.incmwfact(0.05) end,
		{description = "increase master width factor", group = "layout"}
	), AWFUL.key(
		{modkey}, "h", function() AWFUL.tag.incmwfact(-0.05) end,
		{description = "decrease master width factor", group = "layout"}
	), AWFUL.key(
		{modkey, "Shift"}, "h", function() AWFUL.tag.incnmaster(1, nil, true) end,
		{description = "increase the number of master clients", group = "layout"}
	), AWFUL.key(
		{modkey, "Shift"}, "l", function() AWFUL.tag.incnmaster(-1, nil, true) end,
		{description = "decrease the number of master clients", group = "layout"}
	), AWFUL.key(
		{modkey, "Control"}, "h", function() AWFUL.tag.incncol(1, nil, true) end,
		{description = "increase the number of columns", group = "layout"}
	), AWFUL.key(
		{modkey, "Control"}, "l", function() AWFUL.tag.incncol(-1, nil, true) end,
		{description = "decrease the number of columns", group = "layout"}
	), AWFUL.key(
		{modkey}, "space", function() AWFUL.layout.inc(1) end,
		{ description = "select next", group = "layout" }
	), AWFUL.key(
		{modkey, "Shift"}, "space", function() AWFUL.layout.inc(-1) end,
		{description = "select previous", group = "layout"}
	), AWFUL.key(
		{modkey, "Control"}, "n",
		function()
			local c = AWFUL.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", {raise = true})
			end
		end,
		{description = "restore minimized", group = "client"}
	),
	-- Dmenu options
	AWFUL.key(
		{modkey}, "r", function() AWFUL.util.spawn("dmenu_run") end,
		{description = "run dmenu", group = "launcher"}
	), AWFUL.key(
		{modkey, "Shift"}, "s",
		function()
			AWFUL.util.spawn("bash /home/t.tapai/.dmenu/monitor-settings.sh")
		end,
		{description = "screen config", group = "launcher"}
	), AWFUL.key(
		{modkey}, "e",
		function()
			AWFUL.util.spawn("bash /home/t.tapai/.dmenu/emoji-list.sh")
		end,
		{description = "run emoji app", group = "app"}
	), AWFUL.key(
		{modkey}, "i",
		function()
			AWFUL.util.spawn("bash /home/t.tapai/.dmenu/apps.sh")
		end,
		{description = "run emoji app", group = "app"}
	), AWFUL.key(
		{modkey}, "x",
		function()
			AWFUL.prompt.run {
				prompt = "Run Lua code: ",
				textbox = AWFUL.screen.focused().mypromptbox.widget,
				exe_callback = AWFUL.util.eval,
				history_path = AWFUL.util.get_cache_dir() .. "/history_eval"
			}
		end,
		{description = "lua execute prompt", group = "awesome"}
	),
	-- MENUBAR
	AWFUL.key(
		{modkey}, "p", function() MENUBAR.show() end,
		{description = "show the MENUBAR", group = "launcher"}
	-- TODO: when status changes the panel line is not updated
	), AWFUL.key(
			{modkey}, "t",
			function()
				status = 10
			end,
			{description = "testing gui change", group = "awesome"}
		)
)

clientkeys = GEARS.table.join(
	AWFUL.key(
		{modkey}, "f",
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}
	), AWFUL.key(
		{modkey, "Shift"}, "c",
		function(c) c:kill() end,
		{ description = "close", group = "client" }
	), AWFUL.key(
		{modkey, "Control"}, "space", AWFUL.client.floating.toggle,
		{description = "toggle floating", group = "client"}
	), AWFUL.key(
		{modkey, "Control"}, "Return",
		function(c) c:swap(AWFUL.client.getmaster()) end,
		{description = "move to master", group = "client"}
	), AWFUL.key(
		{modkey}, "o",
		function(c) c:move_to_screen() end,
		{ description = "move to screen", group = "client" }
	), AWFUL.key(
		{modkey}, "t",
		function(c) c.ontop = not c.ontop end,
		{description = "toggle keep on top", group = "client"}
	),
	-- The client currently has the input focus, so it cannot be
	-- minimized, since minimized clients can't have the focus.
	AWFUL.key(
		{modkey}, "n",
		function(c) c.minimized = true end,
		{description = "minimize", group = "client"}
	), AWFUL.key(
		{modkey}, "m",
		function(c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{description = "(un)maximize", group = "client"}
	), AWFUL.key(
		{modkey, "Control"}, "m",
		function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end,
		{description = "(un)maximize vertically", group = "client"}
	), AWFUL.key(
		{modkey, "Shift"}, "m",
		function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end,
		{description = "(un)maximize horizontally", group = "client"}
	), AWFUL.key(
		{modkey}, "left mouse click",
		function() end,
		{ description = "move focused client", group = "client" }
	),AWFUL.key(
		{modkey}, "right mouse click",
		function() end,
		{description = "resize focused client", group = "client"}
	)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = GEARS.table.join(globalkeys, -- View tag only.
	AWFUL.key({modkey}, "#" .. i + 9, function()
		local screen = AWFUL.screen.focused()
		local tag = screen.tags[i]
		if tag then tag:view_only() end
	end, {description = "view tag #" .. i, group = "tag"}),
	-- Toggle tag display.
									AWFUL.key({modkey, "Control"}, "#" .. i + 9,
											function()
		local screen = AWFUL.screen.focused()
		local tag = screen.tags[i]
		if tag then AWFUL.tag.viewtoggle(tag) end
	end, {description = "toggle tag #" .. i, group = "tag"}),
	-- Move client to tag.
									AWFUL.key({modkey, "Shift"}, "#" .. i + 9,
											function()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then client.focus:move_to_tag(tag) end
		end
	end, {description = "move focused client to tag #" .. i, group = "tag"}),
	-- Toggle tag on focused client.
									AWFUL.key({modkey, "Control", "Shift"},
											"#" .. i + 9, function()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then client.focus:toggle_tag(tag) end
		end
	end, {description = "toggle focused client on tag #" .. i, group = "tag"}))
end

clientbuttons = GEARS.table.join(
	AWFUL.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
	end),
	AWFUL.button({modkey}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		AWFUL.mouse.client.move(c)
	end),
	AWFUL.button({modkey}, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		AWFUL.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
AWFUL.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = 5,
			border_color = GEARS.color.parse_color("#00000000"),
			-- border_width = BEAUTIFUL.border_width,
			-- border_color = BEAUTIFUL.border_normal,
			focus = AWFUL.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = AWFUL.screen.preferred,
			placement = AWFUL.placement.no_overlap +
				AWFUL.placement.no_offscreen
		}
	}, -- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry"
			},
			class = {
				"Arandr", "Blueman-manager", "Gpick", "Kruler", "MessageWin", -- kalarm.
				"Sxiv", "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui", "veromix", "xtightvncviewer"
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester" -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},
		properties = {floating = true}
	}, -- Add titlebars to normal clients and dialogs
	-- { rule_any = {type = { "normal", "dialog" }
	{rule_any = {type = {"dialog"}}, properties = {titlebars_enabled = true}},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- TODO: not working
	{rule = {class = "firefox"}, properties = {screen = 1, tag = "3"}},
	{rule = {class = "authy"}, properties = {screen = 1, tag = "2"}}
}

-- turn titlebar on when client is floating
client.connect_signal("property::floating", function(c)
	if c.floating and not c.requests_no_titlebar then
		AWFUL.titlebar.show(c)
	else
		AWFUL.titlebar.hide(c)
	end
end)

-- turn tilebars on when layout is floating
AWFUL.tag.attached_connect_signal(nil, "property::layout", function(t)
	local float = t.layout.name == "floating"
	for _, c in pairs(t:clients()) do
		c.floating = float
		-- added resize to floating mode
		-- c.maximized_horizontal = false
		-- c.maximized_vertical		= false
		-- AWFUL.mouse.client.move(c)
	end
end)

-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then AWFUL.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and
		not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		AWFUL.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = GEARS.table.join(AWFUL.button({}, 1, function()
		c:emit_signal("request::activate", "titlebar", {raise = true})
		AWFUL.mouse.client.move(c)
	end), AWFUL.button({}, 3, function()
		c:emit_signal("request::activate", "titlebar", {raise = true})
		AWFUL.mouse.client.resize(c)
	end))

	AWFUL.titlebar(c, {
		--bg_normal = color.transparent,
		--fg_normal = color.primary,
		--bg_focus = color.primary,
		--fg_focus = color.secondary
	}):setup{
		{ -- Left
			AWFUL.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = WIBOX.layout.fixed.horizontal
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = AWFUL.titlebar.widget.titlewidget(c)
			},
			buttons = buttons,
			layout = WIBOX.layout.flex.horizontal
		},
		{ -- Right
			AWFUL.titlebar.widget.floatingbutton(c),
			AWFUL.titlebar.widget.maximizedbutton(c),
			AWFUL.titlebar.widget.stickybutton(c),
			AWFUL.titlebar.widget.ontopbutton(c),
			AWFUL.titlebar.widget.closebutton(c),
			layout = WIBOX.layout.fixed.horizontal()
		},
		layout = WIBOX.layout.align.horizontal
	}
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::click", function(c)
	c:emit_signal("request::activate", "mouse_click", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = COLOR.primary end)
client.connect_signal("unfocus", function(c) c.border_color = COLOR.transparent end)
-- }}}

-------------------------------------------------------------------------------
-- NOTIFICATINS
-------------------------------------------------------------------------------

require'.notification.battery_low'

-------------------------------------------------------------------------------
-- AUTOSTART APPLICATION
-------------------------------------------------------------------------------

require'.start_up'

