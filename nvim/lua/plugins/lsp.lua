-- ~/.config/nvim/lua/plugins/lsp.lua
return {
	---------------------------------------------------------------------------
	-- 1. Core LSP configs from nvim-lspconfig (no more require('lspconfig'))
	---------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- 1. Build capabilities with cmp support
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_lsp.default_capabilities(capabilities)
			end

			-- Example: tweak lua_ls settings (this merges with lspconfig's defaults)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Go
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				-- optional extra settings:
				-- settings = {
				--   gopls = {
				--     gofumpt = true,
				--   },
				-- },
			})

			-- Python: Pyright
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic", -- "off" | "basic" | "strict"
							autoImportCompletions = true,
						},
					},
				},
			})

			-- Set up keymaps when an LSP attaches to a buffer
			local augroup = vim.api.nvim_create_augroup("UserLspConfig", {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = augroup,
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					local map = vim.keymap.set
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "[d", vim.diagnostic.goto_prev, opts)
					map("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},

	---------------------------------------------------------------------------
	-- 2. Mason: installs LSP binaries
	---------------------------------------------------------------------------
	{
		"mason-org/mason.nvim",
		opts = {}, -- default is fine to start
	},

	---------------------------------------------------------------------------
	-- 3. mason-lspconfig: bridges Mason <-> nvim-lspconfig, auto-enables servers
	---------------------------------------------------------------------------
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			-- Install these automatically (add/remove as you like)
			ensure_installed = {
				"lua_ls",
				"gopls",
				"pyright",
				-- "ts_ls",
				-- "rust_analyzer",
			},
			-- By default, this will call vim.lsp.enable() for installed servers
			-- automatic_enable = true, -- this is the default, so you can omit it
		},
	},
}
