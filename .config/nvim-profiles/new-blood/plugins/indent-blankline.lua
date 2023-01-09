local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	print"[PlugErr] alpha not loaded"
	return
end

indent.setup {
	char = '┊',
	show_trailing_blankline_indent = true,
}
