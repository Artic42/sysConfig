-- Remove arrow keys to force use of vim navigation
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")

-- Some esay duplication make some usual actions faster
vim.keymap.set("i", "jj", "<Escape>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-k><C-s>", ":wa<CR>")
vim.keymap.set("n", "<C-k><C-q>", ":xa<CR>")

-- Enable or disable mouse
vim.keymap.set("n", "<C-k><C-e>", "<cmd>set mouse=a<cr>")
vim.keymap.set("n", "<C-k><C-d>", "<cmd>set mouse=<cr>")
