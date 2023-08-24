local status_ok, hop = pcall(require, "hop")
if not status_ok then
	print "[PlugErr] hop not loaded"
	return
end

hop.setup {
	keys = 'asdfghjkl;zxcvbnm'
}

local hint   = require('hop.hint')
local foward = hint.HintDirection.AFTER_CURSOR
local back   = hint.HintDirection.BEFORE_CURSOR
-- hop word in line
vim.keymap.set('', 'W', function()
	hop.hint_words({ direction = foward, current_line_only = true, })
end, { remap = true })
vim.keymap.set('', 'B', function()
	hop.hint_words({ direction = back, current_line_only = true, })
end, { remap = true })
vim.keymap.set('', 'f', function()
	hop.hint_char1({ direction = foward, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
	hop.hint_char1({ direction = back, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
	hop.hint_char1({ direction = foward, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
	hop.hint_char1({ direction = back, current_line_only = true, hint_offset = 1 })
end, { remap = true })
