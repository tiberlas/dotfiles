GEARS.timer {
	timeout = 60,
	call_now = true,
	autostart = true,
	callback = function()
		AWFUL.spawn.easy_async([[cat /sys/class/power_supply/BAT0/capacity]],
		function(stdout0)
			batcapacity = tonumber(stdout0)
			AWFUL.spawn.easy_async([[cat /sys/class/power_supply/BAT0/capacity]], function(stdout1) batstatus = stdout1:sub(1, -2) end)
			if (batcapacity <= 20 and batstatus == "Discharging") then
				battery_notify = NAUGHTY.notify {
					title = "Machine is low on health\n\n",
					text = "Machine power on "..batcapacity.."% ",
					icon = "../utils/pictures/firefox.cute-exiting.png",
					icon_size = 50,
					timeout = 120,
					border_width = 5,
					border_color = COLOR.secondary
				}
			end
		end)
	end
}
