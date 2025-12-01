-- ~/.config/nvim/lua/plugins/git.lua
return {

	---------------------------------------------------------------------------
	-- 1. vim-fugitive: Git inside Neovim
	---------------------------------------------------------------------------
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gstatus",
			"Gblame",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
		},
		keys = {
			{ "<leader>gs", "<cmd>G<CR>",          desc = "Git status (fugitive)" },
			{ "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git diff (current file)" },
			{ "<leader>gb", "<cmd>Gblame<CR>",     desc = "Git blame (current file)" },
			{ "<leader>gc", "<cmd>G commit<CR>",   desc = "Git commit" },
			{ "<leader>gp", "<cmd>G push<CR>",     desc = "Git push" },
		},
	},

	---------------------------------------------------------------------------
	-- 2. gitsigns: signs + hunk actions in the gutter
	---------------------------------------------------------------------------

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- signs/options if you want them later
		},
		keys = {
			{ "]h",         "<cmd>Gitsigns next_hunk<CR>",       desc = "Next git hunk" },
			{ "[h",         "<cmd>Gitsigns prev_hunk<CR>",       desc = "Prev git hunk" },
			{ "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>",      desc = "Stage hunk",           mode = { "n", "v" } },
			{ "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>",      desc = "Reset hunk",           mode = { "n", "v" } },
			{ "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>",    desc = "Preview hunk" },
			{ "<leader>hb", "<cmd>Gitsigns blame_line full<CR>", desc = "Git blame line (full)" },
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},

	---------------------------------------------------------------------------
	-- 3. diffview: multi-file diffs & history
	---------------------------------------------------------------------------
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewFileHistory",
		},
		keys = {
			{ "<leader>do", "<cmd>DiffviewOpen<CR>",          desc = "Diffview: open" },
			{ "<leader>dc", "<cmd>DiffviewClose<CR>",         desc = "Diffview: close" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory<CR>",   desc = "Diffview: file history" },
			{ "<leader>df", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: current file history" },
		},
		opts = {},
	},

	---------------------------------------------------------------------------
	-- 4. lazygit.nvim: open LazyGit from inside Neovim
	---------------------------------------------------------------------------
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
		},
	},
}
