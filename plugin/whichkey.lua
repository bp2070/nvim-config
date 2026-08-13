local wk = require("which-key")
wk.setup({
	preset = "helix",
})

wk.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>c", group = "Code" },
	{ "<leader>d", group = "Debug / Profiler" },
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
	{ "<leader>q", group = "Session" },
	{ "<leader>s", group = "Search" },
	{ "<leader>u", group = "UI / Toggles" },
	{ "<leader>w", group = "Window" },
	{ "<leader>m", desc = "Show System Messages", icon = { icon = "\u{f075} ", color = "yellow" } },
	{ "<leader>K", desc = "Keyword Lookup (help/man)", icon = { icon = "\u{f02d} ", color = "green" } },
	{ "<leader>N", desc = "Neovim News", icon = { icon = "\u{f1ea} ", color = "purple" } },
	{ "<leader>/", desc = "Grep", icon = { icon = "\u{f002} ", color = "cyan" } },
	{ "<leader>:", desc = "Command History", icon = { icon = "\u{f120} ", color = "azure" } },
})
