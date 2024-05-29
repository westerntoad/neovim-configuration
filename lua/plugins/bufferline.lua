return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
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
