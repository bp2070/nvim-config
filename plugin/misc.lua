-- INFO: utility plugins
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/windwp/nvim-autopairs",   -- auto pairs
  "https://github.com/folke/todo-comments.nvim" -- highlight TODO/INFO/WARN comments
}, { confirm = false })

require("lualine").setup({
  options = {
    section_separators = { left = "", right = "", },
    component_separators = { left = "", right = "", },
  },
})
require("nvim-autopairs").setup()
require("todo-comments").setup()
