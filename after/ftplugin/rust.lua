

local Terminal  = require('toggleterm.terminal').Terminal


local command = "rustc " .. vim.fn.expand("%") ..
		" && " .. 
		"./" .. string.sub(vim.fn.expand("%"), 1, -4)

local compile = Terminal:new({
	cmd = command,
	direction = "tab",
	close_on_exit = false,
	on_open = function(term)
    	  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  	end,
})

function _compile_java_toggle()
  compile:toggle()
end


local wk = require "which-key"

wk.register({
  ["<leader>cc"] = { "<cmd>lua _compile_java_toggle()<cr>", "Compile & Run Java Code" },
})
