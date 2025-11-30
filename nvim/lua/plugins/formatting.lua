-- ~/.config/nvim/lua/plugins/formatting.lua
-- Installation of the different formatters.
--# Lua
-- brew install stylua
--
-- # Go
-- brew install gofumpt
-- # goimports is part of the Go tools; if needed:
-- go install golang.org/x/tools/cmd/goimports@latest
--
-- # JS/TS/Markdown via node
-- npm install -g prettier
-- # optional, faster daemon:
-- npm install -g @fsouza/prettierd
--
-- # JSON
-- brew install jq
--
-- # YAML
-- brew install yamlfmt
-- brew install yamllint
--
-- # Shell
-- brew install shfmt
return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- 1. Which formatter(s) to use per filetype
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt", "goimports" }, -- gofumpt then goimports
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			json = { "jq" },
			yaml = { "yamlfmt", "yamllint" },
			markdown = { "prettierd", "prettier" },
			sh = { "shfmt" },
			-- add more as you go, e.g.:
			python = { "black", "isort" }, -- ruff_format
			-- kotlin = { "ktlint" },
			-- dart = { "dart_format" },
		},

		-- 2. Format-on-save behavior
		format_on_save = function(bufnr)
			-- Disable autoformat on certain filetypes if you like
			local ignore_ft = { "sql" }
			local ft = vim.bo[bufnr].filetype
			for _, v in ipairs(ignore_ft) do
				if v == ft then
					return
				end
			end

			return {
				timeout_ms = 2000,
				lsp_fallback = true, -- use LSP if no formatter is configured
			}
		end,

		-- 3. Manual formatting command
		-- :lua require("conform").format()
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- Optional: keymap to format manually
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })
	end,
}
