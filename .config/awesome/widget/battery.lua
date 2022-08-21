-- batery:               {  }
-- charging:  ଘ(੭*ˊᵕˋ)੭* {  }
-- charged:      (*ˊᵕˋ*) {  }

return AWFUL.widget.watch(
		{ AWFUL.util.shell, "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed -n '/present/,/icon-name/p'" },
		30,
		function(widget, stdout)
				local bat_now = {
						present			 = "N/A",
						state				 = "N/A",
						warninglevel = "N/A",
						energy			 = "N/A",
						energyfull	 = "N/A",
						energyrate	 = "N/A",
						voltage			 = "N/A",
						percentage	 = "N/A",
						capacity		 = "N/A",
						icon				 = "N/A"
				}

				for k, v in string.gmatch(stdout, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
						if		 k == "present"				then bat_now.present			= v
						elseif k == "state"					then bat_now.state				= v
						elseif k == "warning-level" then bat_now.warninglevel = v
						elseif k == "energy"				then bat_now.energy				= string.gsub(v, ",", ".") -- Wh
						elseif k == "energy-full"		then bat_now.energyfull		= string.gsub(v, ",", ".") -- Wh
						elseif k == "energy-rate"		then bat_now.energyrate		= string.gsub(v, ",", ".") -- W
						elseif k == "voltage"				then bat_now.voltage			= string.gsub(v, ",", ".") -- V
						elseif k == "percentage"		then bat_now.percentage		= tonumber(v)							 -- %
						elseif k == "capacity"			then bat_now.capacity			= string.gsub(v, ",", ".") -- %
						elseif k == "icon-name"			then bat_now.icon					= v
						end
				end

				local batery_icon = ""
				if (bat_now.percentage <= 20) then
					batery_icon = ""
				elseif (bat_now.percentage > 20 and bat_now.percentage <= 40) then
					batery_icon = ""
				elseif (bat_now.percentage > 40 and bat_now.percentage <= 60) then
					batery_icon = ""
				elseif (bat_now.percentage > 60 and bat_now.percentage <= 80) then
					batery_icon = ""
				else
					batery_icon = ""
				end
				local batery_state = ""
				if bat_now.state ~= "discharging" then
					batery_state = "ଘ(੭*ˊᵕˋ)੭* "
				else
					batery_state = ""
				end
				widget:set_text(batery_state..batery_icon)
		end
)
