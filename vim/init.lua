local cmd      = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn       = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g        = vim.g      -- a table to access global variables
local opt      = vim.opt  -- to set options

local ts       = require 'nvim-treesitter.configs'
local lsp      = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require "paq" {
  {'savq/paq-nvim', opt = true};
  'shougo/deoplete-lsp';
  {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']};
  'nvim-treesitter/nvim-treesitter';
  'neovim/nvim-lspconfig';
  {'junegunn/fzf', run = fn['fzf#install']};
  'junegunn/fzf.vim';
  'ojroques/nvim-lspfuzzy';
  'christoomey/vim-tmux-runner';
  'christoomey/vim-tmux-navigator';
  'janko/vim-test';
  'tpope/vim-commentary';
  'tpope/vim-endwise';
  'tpope/vim-surround';
  'tpope/vim-rails';
  'adelarsq/vim-matchit';
  'kana/vim-textobj-user';
  'rhysd/vim-textobj-ruby';
  'easymotion/vim-easymotion';
}

vim.o.shell = '/bin/zsh';
vim.g.mapleader = " "
vim.o.number = true;
vim.o.relativenumber = true;
vim.o.scrolloff = 4;
vim.o.shiftwidth = 2;
vim.o.softtabstop = 2;
vim.o.smartindent = true;

-- save and quit
map('n', '<leader>w', ':w<cr>');
map('n', '<leader>q', ':q<cr>');
map('n', '<leader>wq', ':wq<cr>');

-- source
map('n', '<leader>so', ':source ~/.config/nvim/init.lua<cr>');
map('n', '<leader>nv', ':tabedit ~/.config/nvim/init.lua<cr>');

-- exit insert mode
map('i', 'jk', '<esc>:w<cr>');
map('i', 'kj', '<esc>:w<cr>');

-- substitution
map('n', '<leader>sub', ':%s///g<left><left>');
map('v', '<leader>sub', ':s///g<left><left>');

-- fzf
map('n', '<C-p>a', ':FZF<CR>');

-- vim tmux runner
map('n', '<leader>ra', ':VtrAttachToPane<cr>');
map('n', '<leader>rz', ':VtrFocusRunner<cr>');
map('n', '<leader>rd', ':VtrSendCtrlD<cr>');

-- tests
g['test#strategy'] = 'vtr';

map('n', '<C-t><C-n>', ':VtrAttachToPane<cr>');
map('n', '<C-t><C-f>', ':TestFile<cr>');
map('n', '<C-t><C-a>', ':TestSuite<cr>');
map('n', '<C-t><C-p> ', ':TestLast<cr>');
map('n', '<C-t><C-v> ', ':TestVisit<cr>');

--
ts.setup {ensure_installed = 'maintained', highlight = {enable = true, indent = true}}

-- deoplete
g['deoplete#enable_at_startup'] = 1;

-- lsp
lsp.tsserver.setup {}
lsp.elixirls.setup{
  cmd = { "/home/dbesserman/.elixir-ls/language_server.sh" };
}

lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

map('n', '<A-s>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<A-s>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<A-s>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<A-s>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<A-s>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<A-s>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<A-s>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<A-s>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<A-s>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
