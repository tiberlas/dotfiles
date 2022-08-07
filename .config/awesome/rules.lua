AWFUL.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = 5,
			border_color = GEARS.color.parse_color(COLOR.transparent),
			-- border_width = BEAUTIFUL.border_width,
			-- border_color = BEAUTIFUL.border_normal,
			focus = AWFUL.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = AWFUL.screen.preferred,
			placement = AWFUL.placement.no_overlap + AWFUL.placement.no_offscreen,
		},
	}, -- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	}, -- Add titlebars to normal clients and dialogs
	-- { rule_any = {type = { "normal", "dialog" }
	{ rule_any = { type = { "dialog" } }, properties = { titlebars_enabled = true } },
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

