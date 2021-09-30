let mapleader="\<space>"

call plug#begin('~/.vim/plugged')

Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

call plug#end()
