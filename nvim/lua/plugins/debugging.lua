return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
        "theHamsta/nvim-dap-virtual-text", 
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        require("dap-python").setup("python3")

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
        vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end)

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

        
        local dap = require("dap")

	-- ===========================
	-- PYTHON ADAPTER (your existing one)
	-- ===========================
	dap.adapters.python = {
	    type = "executable",
	    command = "python3",
	    args = { "-m", "debugpy.adapter" },
	}

        -- Python debugger config
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                        return cwd .. "/venv/bin/python"
                    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                        return cwd .. "/.venv/bin/python"
                    else
                        return "/usr/bin/python"
                    end
                end,
            },
        }

	-- ===========================
	-- GDB ADAPTER (C / C++)
	-- ===========================
	dap.adapters.gdb = {
	    type = "executable",
	    command = "gdb",
	    args = { "-i", "dap" },
	}

	dap.configurations.cpp = {
	    {
		name = "Launch with GDB",
		type = "gdb",
		request = "launch",
		program = function()
		    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = false,
	    },
	}

	-- Reuse C++ config for C
	dap.configurations.c = dap.configurations.cpp

    end,
}
