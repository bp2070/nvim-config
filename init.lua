vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/folke/persistence.nvim",
  "https://github.com/rachartier/tiny-cmdline.nvim",
  "https://github.com/nvimdev/dashboard-nvim",
  "https://github.com/folke/flash.nvim",
  -- Pin to the stable v1 branch: v2 requires the separate saghen/blink.lib package.
  { src = "https://github.com/saghen/blink.cmp", version = "v1" },
  "https://github.com/folke/which-key.nvim",
  "https://github.com/neovim/nvim-lspconfig",                     -- default configs for lsps
  "https://github.com/mason-org/mason.nvim",                      -- package manager
  "https://github.com/mason-org/mason-lspconfig.nvim",            -- lspconfig bridge
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- auto installer
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/rachartier/tiny-code-action.nvim",
  -- "https://github.com/folke/trouble.nvim",
  "https://github.com/akinsho/toggleterm.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/windwp/nvim-autopairs",    -- auto pairs
  "https://github.com/folke/todo-comments.nvim", -- highlight TODO/INFO/WARN comments
  "https://github.com/lewis6991/gitsigns.nvim",
  -- "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/nvim-mini/mini.files",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/bp2070/bufferlist.nvim",
  "https://github.com/hedyhli/outline.nvim",
  "https://github.com/selimacerbas/live-server.nvim",
  "https://github.com/selimacerbas/markdown-preview.nvim",
  "https://github.com/atiladefreitas/dooing",
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
}, { confirm = false })

require("catppuccin").setup {
  custom_highlights = function(colors)
    return {
      Normal = { bg = "#214166" },
      CursorLine = { bg = "#264a6a" },
      LineNr = { fg = colors.surface2 },
      GitSignsCurrentLineBlame = { fg = colors.subtext0 },
    }
  end
}
vim.cmd.colorscheme "catppuccin-mocha"

require("markdown_preview").setup({
  -- all optional; sane defaults shown
  instance_mode = "takeover",     -- "takeover" (one tab) or "multi" (tab per instance)
  port = 0,                       -- 0 = auto (8421 for takeover, OS-assigned for multi)
  open_browser = true,
  default_theme = "dark",         -- "dark" or "light"; initial preview theme
  debounce_ms = 300,
});

require("nvim-autopairs").setup()
require("todo-comments").setup()

require("config")
require("vim._core.ui2").enable({})

-- Configure the plugin
require('bufferlist').setup({
  width = 25,
  open_on_startup = true,
})

vim.keymap.set('n', '<leader>bl', '<cmd>BufferListToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>b1', '<cmd>BufferListSelect 1<CR>', { silent = true })
vim.keymap.set('n', '<leader>b2', '<cmd>BufferListSelect 2<CR>', { silent = true })
vim.keymap.set('n', '<leader>b3', '<cmd>BufferListSelect 3<CR>', { silent = true })
vim.keymap.set('n', '<leader>b4', '<cmd>BufferListSelect 4<CR>', { silent = true })
vim.keymap.set('n', '<leader>b5', '<cmd>BufferListSelect 5<CR>', { silent = true })
vim.keymap.set('n', '<leader>b6', '<cmd>BufferListSelect 6<CR>', { silent = true })
vim.keymap.set('n', '<leader>b7', '<cmd>BufferListSelect 7<CR>', { silent = true })
vim.keymap.set('n', '<leader>b8', '<cmd>BufferListSelect 8<CR>', { silent = true })
vim.keymap.set('n', '<leader>b9', '<cmd>BufferListSelect 9<CR>', { silent = true })

local function set_transparent() -- set UI component to transparent
  local groups = {
    -- "Normal",
    -- "NormalNC",
    -- "EndOfBuffer",
    -- "NormalFloat",
    -- "FloatBorder",
    -- "SignColumn",
    "StatusLine",
    -- "StatusLineNC",
    -- "TabLine",
    -- "TabLineFill",
    -- "TabLineSel",
    -- "ColorColumn",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
  -- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
