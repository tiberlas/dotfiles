local M = {}

M.secret = function(secrets)
	local accounts = ""
	for secret_name,secret_val in pairs(secrets) do
		-- must have *pass* property
		if (secret_val.pass ~= nil and string.len(secret_val.pass) > 0) then
			if string.len(accounts) == 0 then
				accounts = secret_name
			else
				accounts = accounts .. "\n" .. secret_name
			end
		end
	end
	local command = "echo \""..accounts.."\" | dmenu -i -l 3 -p 'Ψ(｀∀´#)  '"
	local handle = io.popen(command)
	local dmenu_response = handle:read("*a")
	handle:close()
	--remove *return char* character from the end
	dmenu_response = string.gsub(dmenu_response, "%s+", "")
	if dmenu_response ~= nil and string.len(dmenu_response) > 0 then
		local copy_command = "echo \"" .. secrets[dmenu_response].pass .. "\" | xclip -selection c"
		os.execute(copy_command)
	end
end

return M
