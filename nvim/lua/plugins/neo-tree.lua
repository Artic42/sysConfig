return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<Leader>n", "<cmd>Neotree current<CR>")
		vim.keymap.set("n", "<C-w><Leader>nv", "<C-w>v<cmd>Neotree current<CR>")
		vim.keymap.set("n", "<C-w><Leader>ns", "<C-w>s<cmd>Neotree current<CR>")
	end,
}
