client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then AWFUL.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		AWFUL.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = GEARS.table.join(
		AWFUL.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			AWFUL.mouse.client.move(c)
		end),
		AWFUL.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			AWFUL.mouse.client.resize(c)
		end)
	)

	AWFUL.titlebar(c, {
		--bg_normal = color.transparent,
		--fg_normal = color.primary,
		--bg_focus = color.primary,
		--fg_focus = color.secondary
	}):setup({
		{ -- Left
			AWFUL.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = WIBOX.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = AWFUL.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = WIBOX.layout.flex.horizontal,
		},
		{ -- Right
			AWFUL.titlebar.widget.floatingbutton(c),
			AWFUL.titlebar.widget.maximizedbutton(c),
			AWFUL.titlebar.widget.stickybutton(c),
			AWFUL.titlebar.widget.ontopbutton(c),
			AWFUL.titlebar.widget.closebutton(c),
			layout = WIBOX.layout.fixed.horizontal(),
		},
		layout = WIBOX.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::click", function(c)
	c:emit_signal("request::activate", "mouse_click", { raise = false })
end)

-- Set border color for focused/unfocused window
client.connect_signal("focus", function(c)
	c.border_color = COLOR.primary
end)

client.connect_signal("unfocus", function(c)
	c.border_color = COLOR.transparent
end)

