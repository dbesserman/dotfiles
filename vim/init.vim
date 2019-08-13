set shell=/bin/zsh
set encoding=utf-8
set fileencoding=utf-8
set number                      " Display line numbers beside buffer
set nocompatible                " Don't maintain compatibilty with Vi.
filetype off                    " required for vundle
set hidden                      " Allow buffer change w/o saving
set lazyredraw                  " Don't update while executing macros
set backspace=indent,eol,start  " Sane backspace behavior
set history=1000                " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set incsearch
set hlsearch                    " highlight matches
set ignorecase
set smartcase
set showcmd                     " display incomplete commands
set relativenumber
set nobackup
set nowritebackup
set breakindent
set noswapfile
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

"""coc.vim setup
set cmdheight=2 " Better display for messages
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" add a float window with hover information
nmap <leader>h :call CocAction('doHover')<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
""" end of coc.vim setup

source ~/.vim/colors/dracula.vim " color scheme

nmap 0 ^

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
set inccommand=split
" source ~/.vimrc

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap jk <esc>:w<cr>
imap kj <esc>:w<cr>

let mapleader = "\<Space>"

"save & quit
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>wq :w<cr>:q<cr>

" wrapping and highlight
map <leader>no :let @/ = ""<cr>
map <leader>yw :set wrap<cr>
map <leader>nw :set nowrap<cr>

" pry
map <leader>pr obinding.pry<esc>==
map <leader>pR Obinding.pry<esc>==
map <leader>Pr orequire 'pry'; binding.pry<esc>==
map <leader>PR Orequire 'pry'; binding.pry<esc>==

" vtr
map <leader>ra :VtrAttachToPane<cr>
map <leader>rz :VtrFocusRunner<cr>
map <leader>rd :VtrSendCtrlD<cr>

" navigating between tabs
map <leader>tp gT
map <leader>tn gt

" navigating between tabs
map <leader>tp gT
map <leader>tn gt

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <leader>nv :tabedit ~/.config/nvim/init.vim<cr>
nmap <leader>so :source ~/.config/nvim/init.vim<cr>


" NERDTree
map <leader>nt :NERDTreeToggle<cr>

" GitGutter
map <leader>gi :GitGutterToggle<cr>
map <leader>gb :Gblame<cr>

" Substitution
nnoremap <leader>sub :%s///g<left><left>
vnoremap <leader>sub :s///g<left><left>

" RSpec.vim mappings
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <Leader>tF :call RunCurrentSpecFile()<CR>:VtrFocusRunner<cr>
map <Leader>ts :call RunNearestSpec()<CR>
map <Leader>tS :call RunNearestSpec()<CR>:VtrFocusRunner<cr>
map <Leader>tp :call RunLastSpec()<CR>
map <Leader>tP :call RunLastSpec()<CR>:VtrFocusRunner<cr>
map <Leader>ta :call RunAllSpecs()<CR>
map <Leader>tA :call RunAllSpecs()<CR>:VtrFocusRunner<cr>

call plug#begin('~/.vim/plugged')
" Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'
Plug 'https://github.com/dbesserman/vim-rspec'
Plug 'tmhedberg/matchit'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/coc-solargraph'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
call plug#end()

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" let b:ale_linters = {'javascript': ['eslint']}
" let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
