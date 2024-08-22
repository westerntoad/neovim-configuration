-- remapping spacebar as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- persistent undo
vim.opt.undofile = true

-- indent and tab settings
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 8

-- line numbering
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false

-- word wrap
vim.opt.linebreak = true



-- options still under consideration
vim.opt.termguicolors = true

vim.g.do_filetype_lua = 1



-- autocommands
--- This function is taken from https://github.com/norcalli/nvim_utils
local api = vim.api
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local autocmds = {
    reload_vimrc = {
        -- Reload vim config automatically
        {"BufWritePost",[[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]};
    };
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] };
        { "TermOpen", "*", "startinsert" };
        { "TermOpen", "*", "hi NormalInsert guibg=#000000" };
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber winhighlight=Normal:NormalInsert" };
    };
}

nvim_create_augroups(autocmds)
