# Neovim config

A lean Neovim configuration using vim.pack and keeping the plugin count to a minimum

## Key features
- plugin management: vim.pack
- picker: snacks
- files: mini.files
- diagnostics: vim.diagnostics
- treesitter: nvim-treesitter
- LSP support: nvim-lspconfig and mason
- command line: tiny-cmdline
- shortcut help: whichkey
- code actions: tiny-code-action
- git: lazygit + gitsigns
- flash
- sessions: persistence.nvim
- dashboard: dashboard-nvim

## Todo
- bufferline takes awhile to start
- better buffer switching (bufferline/harpoon/etc)
- configure toggleterm
- better esc handling for suggestions
- better markdown support
  - highlight, better wrapping, tables, follow links
- update nvim-treesiter/nvim-treesitter to neovim-treesitter/nvim-treesitter
- keymaps for vim.pack to manage plugins (list, remove, etc)
- replace snacks with telescope or fzf?
- configure a linter and formatter (e.g., conform.nvim or nvim-lint) via Mason
