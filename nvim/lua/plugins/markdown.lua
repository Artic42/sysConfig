return {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
        -- configuration here or empty for defaults
    },
    config = function ()
        local builtin = require("markdown").setup()
    end,
}
