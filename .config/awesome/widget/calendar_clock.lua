local clock = WIBOX.widget.textclock()
local calendar = require'widget.calendar'
clock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		calendar.toggle()
	end
end)

return clock
