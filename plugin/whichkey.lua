vim.pack.add({
	"https://github.com/folke/which-key.nvim",
}, { confirm = false })

local wk = require("which-key")
wk.setup({
	preset = "helix",
})
