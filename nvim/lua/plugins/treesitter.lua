return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua",
                "c",
                "javascript",
                "html",
                "css",
                "latex",
                "python",
                "cpp",
                "bash",
                "yaml",
                "nu",
                "tmux",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
