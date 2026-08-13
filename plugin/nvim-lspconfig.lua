-- see `:h lspconfig-all` for available servers and their settings
local lsp_servers = {
	lua_ls = {
		-- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
		Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }, },
	},

	-- TypeScript / JavaScript via vtsls
	vtsls = {},

	-- Java LSP (jdtls)
	-- NOTE: Mason only installs jdtls; this entry actually hooks it into Neovim.
	jdtls = {},
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

-- Create a global LSP autocommand to bind buffer-local keymaps only when an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf
		local opts = { buffer = bufnr, silent = true }

		-- Buffer-local keymaps (only active when LSP is running in this buffer)
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
		vim.keymap.set("n", "grf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "Format Buffer" }))
	end,
})

-- Configure each LSP server using Neovim 0.11+ vim.lsp.config
for server, config in pairs(lsp_servers) do
	vim.lsp.config[server] = {
		settings = config,
	}
	vim.lsp.enable(server)
end
