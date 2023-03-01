local status_ok, luatab = pcall(require, "luatab")
if not status_ok then
	print"[PlugErr] luatab not loaded"
	return
end

luatab.setup()
