

local Terminal  = require('toggleterm.terminal').Terminal


local command = "rustc " .. vim.fn.expand("%") ..
		" && " .. 
		"./" .. string.sub(vim.fn.expand("%"), 1, -4)

local compile = Terminal:new({
	cmd = command,
	direction = "tab",
	close_on_exit = false,
})
--local compile = Terminal:new({
--  cmd = "ls",
--  direction = "tab",
--  dir = "git_dir",
--  on_open = function(term)
--    vim.cmd("startinsert!")
--    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--  end,
--})

function _compile_rust_toggle()
  compile:toggle()
end


local wk = require "which-key"

wk.register({
  ["<leader>tc"] = { "<cmd>lua _compile_rust_toggle()<cr>", "Compile & Run Rust Code" },
--  ["<leader>tc"] = {
--			  "<cmd>terminal<cr>irustc " ..
--  		     	  vim.fn.expand("%") ..
--		     	  "<cr>clear && ./" ..
--		     	  string.sub(vim.fn.expand("%"), 1, -4) ..
--		     	  "<cr>" ..
--			  "<C-\\><C-N>",
--		     	  "Compile & Run Rust Code"
--		   },
})
