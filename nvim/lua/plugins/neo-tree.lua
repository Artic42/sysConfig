return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        vim.keymap.set('n' ,'<Leader>n', '<cmd>Neotree filesystem reveal left<CR>')
        vim.keymap.set('n' ,'<Leader>nt', '<cmd>Neotree filesystem reveal toggle<CR>')
    end
}
