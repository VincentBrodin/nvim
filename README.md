# Minimal Neovim Config

This is a single-file Neovim configuration focused on **speed**, **simplicity**, and **functionality**.
It’s designed to be minimal but includes everything needed for modern development: LSP, autocompletion, file navigation, and search.

## Goals

* **Simplicity** – One clean, readable `init.lua`
* **Minimalism** – Few plugins, only essentials
* **Productivity** – Fast startup, smooth UX

## Plugins

Managed via **`vim.pack.add()`**:

* [kanagawa-paper.nvim](https://github.com/thesimonho/kanagawa-paper.nvim) – Colorscheme
* [eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim) – Quick character-based jumps
* [mini.files](https://github.com/echasnovski/mini.files) – File explorer
* [mini.pairs](https://github.com/echasnovski/mini.pairs) – Auto-close pairs
* [mini.pick](https://github.com/echasnovski/mini.pick) – File and grep picker
* [blink.cmp](https://github.com/Saghen/blink.cmp) – Modern completion engine
* [mason.nvim](https://github.com/mason-org/mason.nvim) – LSP installer
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) – LSP configuration
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) – Syntax highlighting

## Requirements

* **Neovim 0.10+** (nightly) — uses:

  * `vim.pack.add()`
  * `vim.lsp.enable()`
