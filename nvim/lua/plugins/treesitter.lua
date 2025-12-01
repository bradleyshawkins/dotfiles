return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = { "lua", "vim", "vimdoc", "bash", "json", "yaml", "markdown", "go", "python" },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = "<C-s>",
				node_decremental = "<BS>",
			},
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",

					["ac"] = "@class.outer",
					["ic"] = "@class.inner",

					["ai"] = "@conditional.outer",
					["ii"] = "@conditional.inner",

					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
				},
			},

			swap = {
				enable = true,
				swap_next = {
					["]a"] = "@parameter.inner",
				},
				swap_previous = {
					["[a"] = "@parameter.inner",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
