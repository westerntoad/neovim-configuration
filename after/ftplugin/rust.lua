

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
	  vim.opt_local.laststatus = 0
  	end,
})
function _compile_rust_toggle()
  compile:toggle()
end

local cargo_run = Terminal:new({
    cmd = "cargo run",
    direction = "tab",
    close_on_exit = false,
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _cargo_run_toggle()
    cargo_run:toggle()
end

local cargo_test = Terminal:new({
    cmd = "cargo test",
    direction = "tab",
    close_on_exit = false,
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _cargo_test_toggle()
    cargo_test:toggle()
end

local cargo_check = Terminal:new({
    cmd = "cargo check",
    direction = "horizontal",
    close_on_exit = false,
    on_open = function(term)
        vim.cmd("stopinsert")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "s", "<cmd>wincmd k<CR>", {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>bd!<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _cargo_check_toggle()
    cargo_check:toggle()
end

local cargo_bench = Terminal:new({
    cmd = "cargo bench",
    direction = "tab",
    close_on_exit = false,
    on_open = function(term)
        vim.cmd("stopinsert")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "s", "<cmd>wincmd k<CR>", {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>bd!<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _cargo_bench_toggle()
    cargo_bench:toggle()
end

local wk = require "which-key"

wk.register({
  ["<leader>cb"] = { "<cmd>:update<cr><cmd>lua _cargo_bench_toggle()<cr>", "Bench Cargo Project" },
  ["<leader>cc"] = { "<cmd>:update<cr><cmd>lua _cargo_check_toggle()<cr>", "Check Cargo Project" },
  ["<leader>cf"] = { "<cmd>:update<cr><cmd>lua _compile_rust_toggle()<cr>", "Compile & Run Singular Rust File" },
  ["<leader>cr"] = { "<cmd>:update<cr><cmd>lua _cargo_run_toggle()<cr>", "Run Cargo Project" },
  ["<leader>ct"] = { "<cmd>:update<cr><cmd>lua _cargo_test_toggle()<cr>", "Test Cargo Project" },
})
