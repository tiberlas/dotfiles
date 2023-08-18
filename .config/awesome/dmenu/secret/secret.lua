local M = {}

M.secret = function(secrets)
	local key_names = ""
	for key, _ in pairs(secrets) do
		if string.len(key_names) == 0 then
			key_names = key
		else
			key_names = key_names .. "\\n" ..key
		end
	end
	local command = "echo \""..key_names.."\" | dmenu -i -l 3 -p 'SHHHH: '"
	local handle = io.popen(command)
	local dmenu_response = handle:read("*a")
	handle:close()
	for key, value in pairs(secrets) do
		if key..'\n' == dmenu_response then
			local copy_command = "echo \""..value.."\" | xclip -selection c"
			print("secret: "..copy_command)
			os.execute(copy_command)
			break
		end
	end
end

return M
