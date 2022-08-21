local artorias = require'..ascii.artorias'

GEARS.timer {
	timeout = 60,
	call_now = true,
	autostart = true,
	callback = function()
		AWFUL.spawn.easy_async([[cat /sys/class/power_supply/BAT0/capacity]],
		function(stdout0)
			batcapacity = tonumber(stdout0)
			AWFUL.spawn.easy_async([[cat /sys/class/power_supply/BAT0/status]], function(stdout1) batstatus = stdout1:sub(1, -2) end)
			if (batcapacity <= 20 and batstatus == "Discharging") then
				battery_notify = NAUGHTY.notify {
					title = "Machine is low on health\n\n",
					text = artorias,
					timeout = 120
				}
			end
		end)
	end
}
