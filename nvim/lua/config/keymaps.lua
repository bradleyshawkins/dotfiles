local map = vim.keymap.set
map("i", "jk", "<Esc>", { noremap = true, silent = true })
map("v", "jk", "<Esc>", { noremap = true, silent = true })

-- Move to beginning and end of line
map("n", "H", "^")
map("v", "H", "^")
map("n", "L", "$")
map("v", "L", "$")

-- Save
map("n", "<leader>w", ":w<CR>")
-- Quit
map("n", "<leader>q", ":q<CR>")

-- Switch between buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Split
map("n", "<leader>sv", ":vsplit<CR>") -- vertical
map("n", "<leader>sh", ":split<CR>")  -- horizontal

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z") -- keeps cursor centered after join

-- Copy to system clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Paste from system clipboard
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')

-- Indent then reselect the same block for continuous indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Close a file
map("n", "<leader>bd", ":bd<CR>", { silent = true })
map("n", "<leader>re", ":e!<CR>", { desc = "Reload file (discard changes)" })

-- LSP
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
