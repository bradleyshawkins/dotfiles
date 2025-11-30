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
    },
  },

  ---------------------------------------------------------------------------
  -- 2. gitsigns: signs + hunk actions in the gutter
  ---------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- you can tweak signs here later
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)

      -- Optional: some handy hunk keymaps
      local map = vim.keymap.set
      -- navigate hunks
      map("n", "]h", function() require("gitsigns").next_hunk() end, { desc = "Next git hunk" })
      map("n", "[h", function() require("gitsigns").prev_hunk() end, { desc = "Prev git hunk" })

      -- stage/reset
      map("n", "<leader>hs", function() require("gitsigns").stage_hunk() end, { desc = "Stage hunk" })
      map("n", "<leader>hr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
      map("v", "<leader>hs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Stage hunk (visual)" })
      map("v", "<leader>hr", function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Reset hunk (visual)" })

      -- preview
      map("n", "<leader>hp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })

      -- blame
      map("n", "<leader>hb", function() require("gitsigns").blame_line({ full = true }) end,
        { desc = "Git blame line" })
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
