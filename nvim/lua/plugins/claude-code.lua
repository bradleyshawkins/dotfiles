return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	opts = {

	},
	keys = {
		{ "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" } }
	},
	config = function(_, opts)
		require("claude-code").setup(opts)
	end
}
