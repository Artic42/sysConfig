return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    opts = ...,
    config = function ()
        vim.o.background = "dark" -- or "light" for light mode
        vim.cmd([[colorscheme gruvbox]])
        vim.keymap.set('n' ,'<Leader>kl', ':set background=light<CR>')
        vim.keymap.set('n' ,'<Leader>kd', ':set background=dark<CR>')
    end
}
