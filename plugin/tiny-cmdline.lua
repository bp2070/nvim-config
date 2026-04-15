vim.o.cmdheight = 0

vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { fg = "#89dceb" })
vim.pack.add({ "https://github.com/rachartier/tiny-cmdline.nvim" }, { confirm = false })

require("tiny-cmdline").setup({
  on_reposition = require("tiny-cmdline").adapters.blink,
  width = {
    value = "80%"
  },
  position = {
    y = "15%",
  }
})
