return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        -- Basic keys for debugger
        vim.keymap.set("n", "<F5>", dap.continue, {})
        vim.keymap.set("n", "<F10>", dap.step_over, {})
        vim.keymap.set("n", "<F11>", dap.step_into, {})
        vim.keymap.set("n", "<F12>", dap.step_out, {})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {})
        vim.keymap.set("n", "<Leader>dv", dap.step_over, {})
        vim.keymap.set("n", "<Leader>di", dap.step_into, {})
        vim.keymap.set("n", "<Leader>do", dap.step_out, {})
        vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<Leader>db", dap.set_breakpoint, {})
        vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})
        vim.keymap.set("n", "<Leader>dl", dap.run_last, {})

        -- More complex functions
        vim.keymap.set("n", "<Leader>df", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end)
        vim.keymap.set("n", "<Leader>ds", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end)
        vim.keymap.set("n", "<Leader>lp", function()
            require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end)

        -- DAP UI config
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
