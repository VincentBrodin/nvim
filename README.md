# Minimal Neovim Config

This is a single-file Neovim configuration that aims to stay minimal, fast, and functional. My previous config became too bloated — this is a clean reset that keeps only what I actually use.

## Goals

* **Simplicity** – One clean, readable file
* **Minimalism** – Few plugins, only essentials
* **Functionality** – LSP, file navigation, search, completion, syntax

## Plugins

* [kanagawa-paper.nvim](https://github.com/thesimonho/kanagawa-paper.nvim) – Colorscheme
* [eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim) – Quick character-based jumps
* [mini.files](https://github.com/echasnovski/mini.files) – File explorer
* [mini.pairs](https://github.com/echasnovski/mini.pairs) – Auto-close pairs
* [mini.pick](https://github.com/echasnovski/mini.pick) – File and grep search
* [mini.completion](https://github.com/echasnovski/mini.completion) – LSP-based completion
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) – LSP configuration
* [mason.nvim](https://github.com/mason-org/mason.nvim) – LSP installer
* [mason-registry](https://github.com/mason-org/mason-registry) – LSP metadata
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) – Syntax highlighting

## LSPs Used

Installed and enabled automatically:

* `lua_ls`
* `clangd`
* `gopls`

## Keybindings

* `-` — Toggle file explorer
* `<leader>f` — Pick files
* `<leader>g` — Grep
* `K` — Hover
* `gd` / `gD` — Go to definition / declaration
* `<C-r><C-r>` — Rename
* `<leader>ca` — Code action
* `<leader>lf` — Format buffer

## Requirements

* **Neovim nightly** (0.10+) — uses `vim.pack.add()` and `vim.lsp.enable()`
