

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100

" map leader
let mapleader = ","
nmap <silent> <leader>vv :so ~/.vimrc<CR>

" backspace key behavior
set backspace=eol,start,indent
set wrap
" set to auto read when a file is changed from the outside.
set autoread

" Set 7 lines to the cursor, when moving vertically using t, n
set so=7


execute pathogen#infect()

" For pasting data from outside application into vim.
set pastetoggle=<F2>

" search
set incsearch           " incremental search mode
" set nohlsearch            " highlight search things
set ignorecase          " ignore case when searching
set smartcase           " only works when ignorecase on
set title

" encoding
set encoding=utf-8
set fileencodings=utf-8,latin-1,chinese

" User Interface
set guifont=DejaVu\ Sans\ Mono\ 6
set guioptions=
set ruler

set wildmenu            " Popup a window showing all matching command above command line when autocomplete.

" Better buffer management - hide buffers instead of closing them
set hidden

set history=100
" Default history is only 20
set undolevels=100  " Use more levels of undo


" color scheme
set t_Co=256
colorscheme bubblegum

" no back up/swp files
set nobackup
set noswapfile
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " store swap files here

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

set tabstop=2		" The number of spaces count for a TAB.
set softtabstop=2	" The number of spaces inserted when typing TAB. If not expandtab, type TAB twice, will get one TAB.
set shiftwidth=2	" The number of spaces when auto-indent.
set expandtab		" Use the spaces only.
set smarttab            " Insert appropriate spaces in front of line according to shiftwidth, tabstop, softtabstop.
set autoindent
set smartindent
"set cindent            " cindent will disable smartindent, but only for C-like programming.
set breakindent
set showbreak=\ \ "comment so the white space works

" Remove extra insert since we're using powerline!
set noshowmode

set autowrite		" Automatically save before commands like :next and :make

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:➟\ ,eol:⤦


" set region to United States English
set spelllang=en_us

set number

" for sudo editing
command W w !sudo tee % > /dev/null

" mouse support?
set mouse=a

" highlight current line
set cul

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dvorak and Other keymappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Remap to dvorak, hjkl become htns
noremap n j
noremap n gj
noremap N J
noremap t k
noremap t gk
noremap T K
noremap s l
noremap S L
"Set tags to k, f and F to n and N (next search), s to j (replacing broken from dvorak)
noremap k t
noremap K T
noremap j s
noremap J S
noremap f nzz
noremap F Nzz

" no more :w, can now do ;w!
noremap ; :

sunmap f
sunmap j
sunmap k
sunmap t
sunmap n
sunmap s

"Easy access to beginning and end of line
noremap - $
noremap _ ^

"Switching ` and ', for marks
noremap ` '
noremap ' `

" conventional shifting
:vnoremap < <gv
:vnoremap > >gv

" Folding Stuffs
set foldmethod=marker
" Space will toggle folds!

" Tab Tab to cycle through vim panes
map <Tab><Tab> <C-W>w

" set 'C-Space' to Esc
:inoremap <C-@> <Esc>
:inoremap <C-Space> <Esc>

nnoremap <leader>- <C-W>l
nnoremap <leader>_ <C-W>h

" delete whole words (like Ctrl - Backspace) with Ctrl - w
:imap <C-BS> <C-W>

"For CtrlP
set tags=/home/rtroxler/code/fms/tags
nnoremap <leader>fr :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>r :CtrlPBufTag<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")': ['<c-n>'],
    \ 'PrtSelectMove("k")': ['<c-t>'],
    \ 'PrtHistory(-1)':     ['<down>'],
    \ 'PrtHistory(1)':      ['<up<'],
    \ }

"EasyMotion, ,w to search forward -- ,b to search back
let g:EasyMotion_leader_key='<leader>'
map <Space> <Plug>(easymotion-s2)
let g:EasyMotion_use_upper = 1

" Vim Airline always on
set laststatus=2
"Fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" cycle through buffers
map [27;3;115~ :bnext<cr>
map [27;3;104~ :bprevious<cr>
map <C-x> :bd<cr>

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''


""""" The Silver  Searcher

 if executable('ag')
   " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  ".gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" bind N to grep word under cursor
nnoremap N :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<Space>

" unmap t in quickfix (which was open in tab) so that can use t and n for
" navigation
:autocmd BufReadPost quickfix sunmap t

" map [n and [t to move to next or previous instance in quickfix
nnoremap [n :cnext<CR>
nnoremap [t :cprevious<CR>

"tmux line! Airline for tmux!
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}

" Cursor things, only works in xterm (removed if statement since I'm in tmux
" usually)
" solid underscore
let &t_SI .= "\<Esc>[4 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
