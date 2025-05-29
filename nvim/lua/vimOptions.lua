-- Tabulation management
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Line number management
vim.cmd("set number")
vim.cmd("set relativenumber")

-- General mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Diagnostic config
vim.diagnostic.config { virtual_text = true }
