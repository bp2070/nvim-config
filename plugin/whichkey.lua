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
})
