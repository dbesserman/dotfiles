set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
set inccommand=split
source ~/.vimrc

nmap <leader>nv :tabedit ~/.config/nvim/init.vim<cr>
nmap <leader>so :source ~/.config/nvim/init.vim<cr>

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
call plug#end()

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

let b:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
