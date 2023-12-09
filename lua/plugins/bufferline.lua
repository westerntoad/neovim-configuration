local M = {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{ "<leader>p", "<cmd>BufferLineTogglePin<cr>" },
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},
		},
	},
}

return M
