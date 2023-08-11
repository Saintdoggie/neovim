vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


--set tabbing to 4 characters
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.updatetime = 50;

vim.colorcolumn = 50;

--apparently this does cool colors
vim.opt.termguicolors = true;

vim.opt.updatetime = 50;

vim.colorcolumn = 50;

vim.opt.termguicolors = true;

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-,>', '<Cmd>bp<CR>', opts) --go to prev buffer
map('n', '<A-.>', '<Cmd>bn<CR>', opts) --go to next buffer

--telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

vim.cmd [[
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
]]
