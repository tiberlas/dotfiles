return AWFUL.widget.watch(
	{ AWFUL.util.shell, "-c", "cat /sys/class/power_supply/BAT0/uevent" },
	30,
	function(widget, stdout)
		local bat_now = {
			state = "",
			capacity = "",
		}
		for k,v in string.gmatch(stdout, "([%a]+[%a|_]+)=%s*([%a|%d]+[,|%a|%d]-)") do
			if k == "POWER_SUPPLY_STATUS"	then bat_now.state = v
			elseif k == "POWER_SUPPLY_CAPACITY" then bat_now.capacity = tonumber(v)
			end
		end
		local batery_icon = "  "
		if (bat_now.capacity <= 20) then
			batery_icon = "  "
		elseif (bat_now.capacity > 20 and bat_now.capacity <= 40) then
			batery_icon = "  "
		elseif (bat_now.capacity > 40 and bat_now.capacity <= 60) then
			batery_icon = "  "
		elseif (bat_now.capacity > 60 and bat_now.capacity <= 80) then
			batery_icon = "  "
		else
			batery_icon = "  "
		end
		local batery_state = "    "
		if bat_now.state == "Charging" then
			batery_state = "ଘ(੭*ˊ◡ˋ)੭*   "
		elseif bat_now.state == "Not charging" then
			batery_state = "(*ˊ◡ˋ*)   "
		elseif bat_now.capacity <= 40 then
			batery_state = "( T_T )   "
		else
			batery_state = "( ˊ~ˋ )   "
		end
		widget:set_markup_silently("<b><span foreground='"..COLOR.white.."'>"..batery_state.."{<span foreground='"..COLOR.secondary.."'>"..batery_icon.."</span>}</span></b>")
	end
)
