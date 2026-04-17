vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/folke/persistence.nvim",
  "https://github.com/rachartier/tiny-cmdline.nvim",
  "https://github.com/nvimdev/dashboard-nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/saghen/blink.cmp",
	"https://github.com/folke/which-key.nvim",
  "https://github.com/neovim/nvim-lspconfig", -- default configs for lsps
  "https://github.com/mason-org/mason.nvim", -- package manager
  "https://github.com/mason-org/mason-lspconfig.nvim", -- lspconfig bridge
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- auto installer
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/rachartier/tiny-code-action.nvim",
  -- "https://github.com/folke/trouble.nvim",
  "https://github.com/akinsho/toggleterm.nvim",
	"https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/windwp/nvim-autopairs", -- auto pairs
  "https://github.com/folke/todo-comments.nvim", -- highlight TODO/INFO/WARN comments
  "https://github.com/lewis6991/gitsigns.nvim",
}, { confirm = false })

require("nvim-autopairs").setup()
require("todo-comments").setup()

require("config")
require("vim._core.ui2").enable({})

local function set_transparent() -- set UI component to transparent
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"ColorColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
