#!/usr/bin/lua
--[
-- REQUIREMENTS:
-- have installed lua `sudo apt-get install lua5.1`
-- have installed luarocks `sudo apt-get install luarocks`
-- have installed cjson `sudo luarocks install lua-cjson`
-- have `secret.json` decripted
--]
local cjson_loaded,json = pcall(require, 'cjson')
if cjson_loaded ~= true then
	print"###################"
	print"'cjson' not install"
	print"run: 'sudo luarocks install lua-cjson'"
	print"you have to install luarocks library first!"
	print"###################"
end

local function readFile(file)
    local f = assert(io.open(file, "rb"), "FILE \'" ..file.. "\' DOES NOT EXIST!")
    local content = f:read("*all")
    f:close()
    return content
end

local readFileStatus,readFileResult = pcall(readFile, 'secret.json')
if readFileStatus then
	local secrets = json.decode(readFileResult)
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

else
	--FILE NOT EXISTS
	print"###################"
	print(readFileResult)
	NAUGHTY.notify {
		title = "FILE ENCRIPTED",
		text = 'file encripted',
		timeout = 120
	}
	print"###################"
end
