set shell=/bin/zsh
set encoding=utf-8
set fileencoding=utf-8
set number                      " Display line numbers beside buffer
set nocompatible                " Don't maintain compatibilty with Vi.
filetype on
filetype plugin indent on
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
set rtp+=/usr/local/opt/fzf
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

"set Vim Tmux Runner when vim opens
autocmd VimEnter * VtrAttachToPane

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
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
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
" map <leader>gi :GitGutterToggle<cr>
map <leader>gb :Gblame<cr>

" Substitution
nnoremap <leader>sub :%s///g<left><left>
vnoremap <leader>sub :s///g<left><left>

" Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
nnoremap <leader>f :Format<cr>

nmap <leader>a :A<CR>

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let test#strategy = "vtr"
" " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> <C-t><C-n> :TestNearest<CR>
nmap <silent> <C-t><C-f> :TestFile<CR>
nmap <silent> <C-t><C-a> :TestSuite<CR>
nmap <silent> <C-t><C-p> :TestLast<CR>

map <leader>rcp :VtrSendCommandToRunner recompile()<cr>
map <leader>pmt :VtrSendCommandToRunner rails run_post_migrations_task<cr>
map <leader>mgt :VtrSendCommandToRunner rails db:migrate RAILS_ENV=test<cr>
map <leader>mgd :VtrSendCommandToRunner rails db:migrate<cr>
map <leader>gmdm :VtrSendCommandToRunner rails g multiple_domained_models<cr>

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

nmap <C-p>a :FZF<CR>
nmap <C-p>b :Buffer<CR>
nmap <C-p>l :Lines<CR>
nmap <C-p><C-l>; :BLines<CR>
nmap <C-p>h :History<CR>

imap <C-l> <Plug>(coc-snippets-expand)

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'janko/vim-test'
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
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jgdavey/vim-blockle'
Plug 'elixir-editors/vim-elixir'
Plug 'jreybert/vimagit'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
