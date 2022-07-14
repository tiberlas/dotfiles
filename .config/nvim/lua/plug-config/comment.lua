local status_ok, comment = pcall(require, "kommentary.config")
if not status_ok then
	return
end

comment.use_extended_mappings()

KEYMAP("n", "<leader>ci", "<Plug>kommentary_line_increase", OPTS)
KEYMAP("x", "<leader>ci", "<Plug>kommentary_visual_increase", OPTS)
KEYMAP("n", "<leader>cd", "<Plug>kommentary_line_decrease", OPTS)
KEYMAP("x", "<leader>cd", "<Plug>kommentary_visual_decrease", OPTS)

