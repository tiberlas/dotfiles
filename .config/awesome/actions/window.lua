clientbuttons = GEARS.table.join(
	AWFUL.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	AWFUL.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		AWFUL.mouse.client.move(c)
	end),
	AWFUL.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		AWFUL.mouse.client.resize(c)
	end)
)

clientkeys = GEARS.table.join(
	AWFUL.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	AWFUL.key({ modkey, "Shift" }, "c", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	AWFUL.key(
		{ modkey, "Control" },
		"space",
		AWFUL.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	AWFUL.key({ modkey, "Control" }, "Return", function(c)
		c:swap(AWFUL.client.getmaster())
	end, { description = "move to master", group = "client" }),
	AWFUL.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	AWFUL.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	-- The client currently has the input focus, so it cannot be
	-- minimized, since minimized clients can't have the focus.
	AWFUL.key({ modkey }, "n", function(c)
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	AWFUL.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	AWFUL.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	AWFUL.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" }),
	AWFUL.key({ modkey }, "left mouse click", function() end, { description = "move focused client", group = "client" }),
	AWFUL.key(
		{ modkey },
		"right mouse click",
		function() end,
		{ description = "resize focused client", group = "client" }
	)
)
