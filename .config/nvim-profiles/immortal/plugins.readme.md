# Instructions for plugins for NeoVim

## Mason (https://github.com/williamboman/mason.nvim)

Wrapper for LSP, DSP, Linter, Formatters without them.
Depending what you want you install upper mention packages, then with Mason you install language specific packages.
It has just intuitive UI for installing language specific plugins,
but you NEED to install aditional packages for LSP, DSP, Linter or Formatter.

Commands:
- `Mason` opens Mason UI for installing/managing language specific packages

### LSP (Language Specific Protocol)

LSPConfig(neovim/nvim-lspconfig)
NeoVim has built-in support for LSP
This plugin just makes it easier to configure LSP.

> Note: NeoVim's LSP is just a wrapper for a language specific LSP, so it has no LSP logic it-self.
> You have to install language server for a specific language you want to use and there is where Mason comes in, of course you can install it without Mason

- `LspInfo` shows buffer attached LSP status
- `LspStart LANGUAGE_SERVER` starts a specific LANGUAGE_SERVER
- `LspStop LANGUAGE_SERVER` stops a specific LANGUAGE_SERVER

Mason LSPConfig(williamboman/mason-lspconfig.nvim)
just an adapter between Mason and LSPConfig plugins

FidGet(j-hui/fidget.nvim)
This is just eye-candy; When a new LSP is installing it displays a progress bar on the bottom right corner of the screen.

> IN `lsp.lua` add wanted LSP server in the LSP_LIST array
> available servers: `https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers`

### DSP (Debugger Specific Protocol)

For javascript, typescript and most important jest(testing framework) use *pwa-node*
First install the adapter `https://github.com/microsoft/vscode-js-debug/releases`,
In this config it's install here in 'vscode-js-debug' dir
Next, in 'dap.lua' config set to use this specific adapter
This adapter allows for *haydenmeade/neotest-jest* to debug the test

### Linter

NvimLint (mfussenegger/nvim-lint)

Install a linter through Mason.
Assign a linter for a file type in the linter config.
Treesitter also adds to this.

## NeoTest

set nvm with the correct node version
install all dependencies
open neoVim
run test

## Autocomplete

Use plugin `ms-jpq/coq_nvim`
When the plug is installed run `:COQdep` to install COQ dependencies

Create custom snippets
run `:COQsnips edit javascipt` if you want snippets for javascript
edit the file
save
and run `COQsnips compile`


## Treesitter

In `ensure_installed` add all languages you want to lint

