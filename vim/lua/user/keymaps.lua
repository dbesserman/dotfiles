local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- save and quit
keymap('n', '<Leader>w', '<CMD>w<CR>', opts);
keymap('n', '<Leader>q', '<CMD>q<CR>', opts);
keymap('n', '<Leader>wq', '<CMD>wq<CR>', opts);

-- source
keymap('n', '<Leader>so', '<CMD>source ~/.config/nvim/init.lua<CR>', opts);
keymap('n', '<Leader>nv', '<CMD>tabedit ~/.config/nvim/init.lua<CR>', opts);

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC><CMD>w<CR>", opts)
keymap("i", "kj", "<ESC><CMD>w<CR>", opts)

-- substitution
keymap('n', '<leader>sub', ':%s///g<left><left>', opts);
keymap('v', '<leader>sub', ':s///g<left><left>', opts);

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Plugins --

-- browse
keymap("n", "<C-p>a", "<CMD>Telescope find_files<CR>", opts)

-- toggle NvimTree
keymap("n", "<Leader>nt", "<CMD>NvimTreeToggle<CR>", opts)
