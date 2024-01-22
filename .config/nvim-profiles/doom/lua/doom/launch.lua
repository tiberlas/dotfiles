LAZY_PLUGIN_SPEC = {}
-- spec function will load all lazy plugins
function spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
