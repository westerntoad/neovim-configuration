-- tab movement
vim.keymap.set("n", "<S-l>", "gt")		-- next tab
vim.keymap.set("n", "<S-h>", "gT")		-- previous tab

-- leave terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-N>')





local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "tab",
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
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
  ["<leader>tt"] = { "<cmd>terminal<cr>", "New Terminal" },
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
  ["<leader>ft"] = { "<cmd>Telescope buffers<cr><esc>", "Find Tab-Buffers" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
})
