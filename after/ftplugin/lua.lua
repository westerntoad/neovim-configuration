local Terminal  = require('toggleterm.terminal').Terminal

local run_love = Terminal:new({
    cmd = "love ./",
    direction = "tab",
    close_on_exit = true,
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _run_love_toggle()
    run_love:toggle()
end

local wk = require "which-key"

wk.register({
  ["<leader>cr"] = { "<cmd>:update<cr><cmd>lua _run_love_toggle()<cr>", "Run Directory as LÖVE Project" },
})
