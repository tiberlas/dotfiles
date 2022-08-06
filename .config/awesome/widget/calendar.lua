local M = {}

local cal = WIBOX.widget({
	date = os.date("*t"),
	font = "Monospace 11",
	spacing = 2,
	week_numbers = false,
	start_sunday = false,
	long_weekdays = true,
	widget = WIBOX.widget.calendar.month,
})

local popup = AWFUL.popup({
	ontop = true,
	visible = false,
	offset = { y = 5 },
	border_width = 1,
	border_color = COLOR.primary,
	bg = COLOR.black,
	widget = cal,
})

M.toggle = function()
	if popup.visible then
		-- to faster render the calendar refresh it and just hide
		cal:set_date(nil) -- the new date is not set without removing the old one
		cal:set_date(os.date("*t"))
		popup:set_widget(nil) -- just in case
		popup:set_widget(cal)
		popup.visible = not popup.visible
	else
		AWFUL.placement.top_right(popup, { margins = { top = 30, right = 10 }, parent = AWFUL.screen.focused() })
		popup.visible = true
	end
end

return M
