require("toggleterm").setup({
  shell = 'pwsh -NoLogo',
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    set_terminal_keymaps()
  end,
})

local Terminal = require('toggleterm.terminal').Terminal

local float_term = Terminal:new({
  direction = "float",
  hidden = true,
})

function FloatTermToggle()
  float_term:toggle()
end

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function LazygitToggle()
  lazygit:toggle()
end

vim.keymap.set("n", '<leader>t', FloatTermToggle, { desc = "ToggleTerm" })
vim.keymap.set("n", "<leader>gg", LazygitToggle, { desc = "Lazygit" })
