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

### DSP (Debugger Specific Protocol)

### Linter

NvimLint (mfussenegger/nvim-lint)

Install a linter through Mason.
Assign a linter for a file type in the linter config.

### Formatter


## NeoTest

set nvm with the correct node version
install all dependencies
open neoVim
run test

## Autocomplete

## Treesitter

