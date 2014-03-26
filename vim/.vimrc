"System Variables


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history VIM has to remeber. 
set history=100

" backspace key behavior
set backspace=eol,start,indent
set wrap
" set to auto read when a file is changed from the outside.
set autoread

" Set 7 lines to the cursor, when moving vertically using t, n
set so=7


"Pathogen for plugin stuff
execute pathogen#infect()

" For pasting data from outside application into vim.
set pastetoggle=<F2>

" search
set incsearch           " incremental search mode
set nohlsearch            " highlight search things
set ignorecase          " ignore case when searching
set smartcase           " only works when ignorecase on

" encoding
set encoding=utf-8
set fileencodings=utf-8,latin-1,chinese

" colorscheme 
colorscheme slate 

" User Interface
set guifont=ProFontWindows:h9
set guioptions-=T
set ruler

set wildmenu            " Popup a window showing all matching command above command line when autocomplete.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Coding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"CtrlP stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim

set showmatch 		" show matching brackets.
set matchtime=2         " the length of time to show matching paren.

syntax on
filetype plugin indent on
set iskeyword+=_,$,@,%,#,-  " don't linebreak when encounter these characters.

set tabstop=8		" The number of spaces count for a TAB.
set softtabstop=4	" The number of spaces inserted when typing TAB. If not expandtab, type TAB twice, will get one TAB.
set shiftwidth=4	" The number of spaces when auto-indent.
set expandtab		" Use the spaces only.
set smarttab            " Insert appropriate spaces in front of line according to shiftwidth, tabstop, softtabstop.
set autoindent
set smartindent
"set cindent            " cindent will disable smartindent, but only for C-like programming.

set autowrite		" Automatically save before commands like :next and :make

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:➟\ ,eol:⤦

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
 
" set region to United States English
set spelllang=en_us

set number

" for sudo editing
command W w !sudo tee % > /dev/null


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dvorak and Other keymappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Remap to dvorak, hjkl become htns
noremap n j
noremap N J
noremap t k
noremap T K
noremap s l
noremap S L
"Set tags to k, s to j (replacing broken from dvorak)
noremap k t
noremap K T
noremap j s
noremap J S

"Easy access to beginning and end of line
noremap - $
noremap _ ^

"Switching ` and ', for marks
noremap ` '
noremap ' `

" set 'C-Space' to Esc
:inoremap <C-@> <Esc>

" delete whole words (like Ctrl - Backspace) with Ctrl - w
:imap <C-BS> <C-W>

"For CtrlP
nnoremap <leader>fr :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")': ['<c-n>'],
    \ 'PrtSelectMove("k")': ['<c-t>'],
    \ 'PrtHistory(-1)':     ['<down>'],
    \ 'PrtHistory(1)':      ['<up<'],
    \ }

"EasyMotion (,w to search forward -- ,b to search back) 
let g:EasyMotion_leader_key='<leader>'
