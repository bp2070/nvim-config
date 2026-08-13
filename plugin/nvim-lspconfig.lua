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

		-- Native-like keymaps (only active when LSP is running in this buffer)
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to Definition" }))
		vim.keymap.set("n", "grf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "LSP: Format Buffer" }))

		-- Buffer-local leader mappings (safer version of your global mappings)
		vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP: Go to Definition" }))
		vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "LSP: Go to Declaration" }))
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code Actions" }))
		vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP: Find Implementations" }))
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP: Find References" }))
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "LSP: Format Buffer" }))
	end,
})

-- Safely retrieve completion capabilities from blink.cmp
local capabilities = {}
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
	capabilities = blink.get_lsp_capabilities()
end

-- Configure each LSP server using Neovim 0.11's native config API
for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, {
		settings = config,
		capabilities = capabilities,
	})
	vim.lsp.enable(server)
end
