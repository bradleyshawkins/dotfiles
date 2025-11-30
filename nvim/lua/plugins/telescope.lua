-- ~/.config/nvim/lua/plugins/telescope.lua
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Grep in project" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Help tags" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					-- insert mode
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						-- nice extras if you want:
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
					},
					-- normal mode inside telescope
					n = {
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
					},
				},
			},
		})
	end,
}
