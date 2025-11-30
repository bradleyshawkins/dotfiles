return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File explorer" },
  },
  opts = {
    view = { width = 30 },
    renderer = { group_empty = true },
    filters = { dotfiles = false },
  },
}
