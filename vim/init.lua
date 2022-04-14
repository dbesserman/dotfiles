local cmd      = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn       = vim.fn   -- to call Vim functions e.g. fn.bufnr()
local g        = vim.g    -- a table to access global variables
local opt      = vim.opt  -- to set options

local treesitter = require 'nvim-treesitter.configs'
local lsp        = require 'lspconfig'
local lspfuzzy   = require 'lspfuzzy'
local vimtree    = require 'nvim-tree'

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
  'rcarriga/vim-ultest';
  'tpope/vim-commentary';
  'tpope/vim-endwise';
  'tpope/vim-surround';
  'tpope/vim-rails';
  'tpope/vim-eunuch';
  'adelarsq/vim-matchit';
  'kana/vim-textobj-user';
  'rhysd/vim-textobj-ruby';
  'easymotion/vim-easymotion';
  'kyazdani42/nvim-web-devicons';
  'kyazdani42/nvim-tree.lua';
  'purescript-contrib/purescript-vim';
  'junegunn/vim-easy-align';
}

vim.g.mapleader = " "
vim.g.python_host_prog = 'home/dbesserman/.asdf/shims/python2'
vim.g.python3_host_prog = '/home/dbesserman/.asdf/shims/python3'
vim.o.shell = '/bin/zsh';
vim.o.number = true;
vim.o.relativenumber = true;
vim.o.scrolloff = 4;
vim.o.shiftwidth = 2;
vim.o.softtabstop = 2;
vim.o.smartindent = true;
vim.o.syntax = 'on';
vim.o.runtimepath = vim.o.runtimepath .. ",/home/dbesserman/.opam/cs3110-2021fa/share/ocp-indent/vim"

-- save and quit
map('n', '<leader>w', '<cmd>w<cr>');
map('n', '<leader>q', '<cmd>q<cr>');
map('n', '<leader>wq', '<cmd>wq<cr>');

-- source
map('n', '<leader>so', '<cmd>source ~/.config/nvim/init.lua<cr>');
map('n', '<leader>nv', '<cmd>tabedit ~/.config/nvim/init.lua<cr>');

-- wrapping and highlight
map('n', '<leader>no', '<cmd>let @/ = ""<cr>');
map('n', '<leader>yw', '<cmd>set wrap<cr>');
map('n', '<leader>nw', '<cmd>set nowrap<cr>');

-- exit insert mode
map('i', 'jk', '<esc><cmd>w<cr>');
map('i', 'kj', '<esc><cmd>w<cr>');

-- substitution
map('n', '<leader>sub', ':%s///g<left><left>');
map('v', '<leader>sub', ':s///g<left><left>');

-- fzf
map('n', '<C-p>a', '<cmd>FZF<CR>');

-- vim tmux runner
map('n', '<leader>ra', '<cmd>VtrAttachToPane<cr>');
map('n', '<leader>rz', '<cmd>VtrFocusRunner<cr>');
map('n', '<leader>rd', '<cmd>VtrSendCtrlD<cr>');

-- VTR commands
g['test#strategy'] = 'vtr';

map('n', '<C-t><C-n>', '<cmd>TestNearest<cr>');
map('n', '<C-t><C-f>', '<cmd>TestFile<cr>');
map('n', '<C-t><C-a>', '<cmd>TestSuite<cr>');
map('n', '<C-t><C-p>', '<cmd>TestLast<cr>');
map('n', '<C-t><C-v>', '<cmd>TestVisit<cr>');

map('n', '<leader>mgt', '<cmd>VtrSendCommandToRunner RAILS_ENV=test bundle exec rails db:migrate<cr>');
map('n', '<leader>pmt', '<cmd>VtrSendCommandToRunner bundle exec rails run_post_migrations_task<cr>');
map('n', '<leader>gmdm', '<cmd>VtrSendCommandToRunner bundle exec rails g multiple_domained_models<cr>');

-- vimtree
vimtree.setup {}

map('n', '<leader>nt', '<cmd>NvimTreeToggle<cr>');

-- alternate
map('n', '<leader>a', '<cmd>A<cr>');

-- treesitter
treesitter.setup {ensure_installed = 'maintained', highlight = {enable = true, indent = true}}

-- deoplete
g['deoplete#enable_at_startup'] = 1;

-- lsp
-- lsp.solargraph.setup{}
lsp.tsserver.setup {}
lsp.elixirls.setup{
  cmd = { "/home/dbesserman/.elixir-ls/language_server.sh" };
}
lsp.purescriptls.setup {}
lsp.ocamllsp.setup {}

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

-- commands

map('n', '<leader>ank', '<cmd>VtrSendCommandToRunner curl localhost:8765 -X POST -d @cloze.json<cr>')
