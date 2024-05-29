-- tab movement
vim.keymap.set("n", "<S-l>", "<cmd>:BufferLineCycleNext<cr>")		-- next tab
vim.keymap.set("n", "<S-h>", "<cmd>:BufferLineCyclePrev<cr>")		-- previous tab

-- leave terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-N>')


-- terminal movement
vim.keymap.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)




local Terminal  = require('toggleterm.terminal').Terminal


local empty = Terminal:new({
    dir = "git_dir",
    direction = "tab",
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _empty_toggle()
    empty:toggle()
end

local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "tab",
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.opt_local.laststatus = 0
    end,
})
function _lazygit_toggle()
  lazygit:toggle()
end

--vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


local wk = require "which-key"

wk.register({
  -- terminal junk
  ["<leader>t"] = { name = "+terminal" },
  ["<leader>tt"] = { "<cmd>ToggleTerm direction=tab<cr>", "New Terminal" },
  -- lazygit
  ["<leader>g"] = { "<cmd>lua _lazygit_toggle()<cr>", "Open LazyGit" },
  -- new files
  ["<leader>n"] = { name = "+new" },
  ["<leader>nt"] = { "<cmd>:tabnew<cr>", "New Tab" },
  ["<leader>nf"] = { "<cmd>:tabnew|Telescope find_files<cr>", "New Tab From File" },
  ["<leader>q"] = { "<cmd>:bd<cr>", "Close Tab" },
  -- Telescope keymaps
  ["<leader>f"] = { name = "+file" },
  ["<leader>fb"] = { "<cmd>Telescope file_browser<cr>", "File Browser" },
  ["<leader>ft"] = { "<cmd>Telescope buffers<cr>", "Find Tab-Buffers" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  -- compiling code
  ["<leader>c"] = { name = "+compile" },
  -- saving
  ["<leader>w"] = { name = "+write" },
  ["<leader>wq"] = { "<cmd>update<cr><cmd>q<cr>", "Save and Close File" },
  ["<leader>ww"] = { "<cmd>update<cr>", "Save File" }, 
})
