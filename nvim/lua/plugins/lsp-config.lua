return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function ()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                    "dockerls",
                    "docker_compose_language_service",
                    "bashls",
                    "nginx_language_server",
                    "yamlls",
                    "clangd",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local capabalities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({capabalities = capabalities})
            lspconfig.pylsp.setup({capabalities = capabalities})
            require("lspKeymaps")
        end,
    }

}
