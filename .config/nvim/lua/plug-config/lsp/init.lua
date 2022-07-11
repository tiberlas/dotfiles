local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require".plug-config.lsp.lsp-installer"
require".plug-config.lsp.lsp-keymaps".setup()
require".plug-config.lsp.null-ls"
