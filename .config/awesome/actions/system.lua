-- custom tag fun
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

-- key bindings
globalkeys = GEARS.table.join(
	AWFUL.key({ modkey }, "s", HOTKEYS_POPUP.show_help, { description = "show help", group = "awesome" }),
	AWFUL.key({ modkey }, "a", add_tag, { description = "add a tag", group = "tag" }),
	AWFUL.key({ modkey, "Shift" }, "a", delete_tag, { description = "delete the current tag", group = "tag" }),
	AWFUL.key({ modkey }, "Left", AWFUL.tag.viewprev, { description = "view previous", group = "tag" }),
	AWFUL.key({ modkey }, "Right", AWFUL.tag.viewnext, { description = "view next", group = "tag" }),
	AWFUL.key({ modkey }, "Escape", AWFUL.tag.history.restore, { description = "go back", group = "tag" }),
	AWFUL.key({ modkey }, "j", function()
		AWFUL.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	AWFUL.key({ modkey }, "k", function()
		AWFUL.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	AWFUL.key({ modkey }, "w", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),
	-- Layout manipulation
	AWFUL.key({ modkey, "Shift" }, "j", function()
		AWFUL.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	AWFUL.key({ modkey, "Shift" }, "k", function()
		AWFUL.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	AWFUL.key({ modkey, "Control" }, "j", function()
		AWFUL.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	AWFUL.key({ modkey, "Control" }, "k", function()
		AWFUL.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	AWFUL.key({ modkey }, "u", AWFUL.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	AWFUL.key({ modkey }, "Tab", function()
		AWFUL.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),
	-- Standard program
	AWFUL.key({ modkey }, "Return", function()
		AWFUL.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	AWFUL.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	-- used i3lock-fancy: https://github.com/meskarune/i3lock-fancy
	AWFUL.key({ modkey }, "z", function()
		AWFUL.spawn.with_shell("i3lock-fancy -pg")
	end, { description = "lock screen", group = "awesome" }),
	AWFUL.key({ modkey }, "q", function()
		AWFUL.util.spawn("bash "..HOME.."/utils/dmenu/shutdown.sh")
	end, { description = "quit awesome", group = "awesome" }),
	AWFUL.key({ modkey }, "l", function()
		AWFUL.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	AWFUL.key({ modkey }, "h", function()
		AWFUL.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	AWFUL.key({ modkey, "Shift" }, "h", function()
		AWFUL.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	AWFUL.key({ modkey, "Shift" }, "l", function()
		AWFUL.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	AWFUL.key({ modkey, "Control" }, "h", function()
		AWFUL.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	AWFUL.key({ modkey, "Control" }, "l", function()
		AWFUL.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	AWFUL.key({ modkey }, "space", function()
		AWFUL.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	AWFUL.key({ modkey, "Shift" }, "space", function()
		AWFUL.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
	AWFUL.key({ modkey, "Control" }, "n", function()
		local c = AWFUL.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),
	-- Dmenu options
	AWFUL.key({ modkey }, "r", function()
		AWFUL.util.spawn("dmenu_run")
	end, { description = "run dmenu", group = "launcher" }),
	AWFUL.key({ modkey, "Shift" }, "s", function()
		AWFUL.util.spawn("bash "..HOME.."/utils/dmenu/monitor-settings.sh")
	end, { description = "screen config", group = "launcher" }),
	AWFUL.key({ modkey }, "e", function()
		AWFUL.util.spawn("bash "..HOME.."/utils/dmenu/emoji-list.sh")
	end, { description = "run emoji app", group = "app" }),
	AWFUL.key({ modkey }, "i", function()
		AWFUL.util.spawn("bash "..HOME.."/utils/dmenu/apps.sh")
	end, { description = "run emoji app", group = "app" }),
	AWFUL.key({ modkey }, "x", function()
		AWFUL.prompt.run({
			prompt = "Run Lua code: ",
			textbox = AWFUL.screen.focused().mypromptbox.widget,
			exe_callback = AWFUL.util.eval,
			history_path = AWFUL.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),
	-- MENUBAR
	AWFUL.key(
		{ modkey },
		"p",
		function()
			MENUBAR.show()
		end,
		{ description = "show the MENUBAR", group = "launcher" }
		-- TODO: when status changes the panel line is not updated
	),
	AWFUL.key({ modkey }, "t", function()
		status = 10
	end, { description = "testing gui change", group = "awesome" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = GEARS.table.join(
		globalkeys, -- View tag only.
		AWFUL.key({ modkey }, "#" .. i + 9, function()
			local screen = AWFUL.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		AWFUL.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = AWFUL.screen.focused()
			local tag = screen.tags[i]
			if tag then
				AWFUL.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		AWFUL.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		AWFUL.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

root.keys(globalkeys)

root.buttons(GEARS.table.join(
	AWFUL.button({}, 3, function()
		mymainmenu:toggle()
	end),
	AWFUL.button({}, 4, AWFUL.tag.viewnext),
	AWFUL.button({}, 5, AWFUL.tag.viewprev)
))
