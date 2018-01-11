call plug#begin('~/.config/nvim/plugged')

" Necessities
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jreybert/vimagit'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'

" Colors
Plug 'YorickPeterse/happy_hacking.vim' " Current winner
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'

" Language things
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()

" {{{ General Settings
let mapleader = "\<space>"

syntax enable
filetype plugin indent on

" Don't nag about unwritten changes
set hidden
" Disable another annoying message. Don't forget to save your work often!
set noswapfile

" DISABLED for now: See issue https://github.com/bwot/init.neovim/issues/2
" Prevents lag when moving around and scrolling in vim. Disable with
" `nolazyredraw` if you have problems with vims graphics not being updated
" correctly
" set lazyredraw

" Show show actual line number on current line
set number

set mouse=a

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Show current command at the bottom line of screen
set showcmd

" Highlight matching bracket when cursor is on one of them
set showmatch

" Wrap long line, don't break words
set wrap linebreak

set breakindent
set showbreak=˒˒
"set showbreak=˲˲

" Ignore case when searching ...
set ignorecase
" ... unless search pattern contains upper case characters
set smartcase
" Move to occurence as you search
set incsearch

""" Tabs are Spaces
" Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
" 	   'expandtab'.  This way you will always insert spaces.  The
" 	   formatting will never be messed up when 'tabstop' is changed.
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Round indent to multiple of 'shiftwidth' when indenting with > and <
set shiftround

" Do smart autoindenting when starting a new line
set smartindent

set undofile
set undodir=~/.vim/undo
set undolevels=1000  " Use more levels of undo
set undoreload=10000

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set gdefault

set splitright

set list
set listchars=nbsp:∘,tab:➟\ ,trail:∘

set hlsearch

set statusline=%F       "tail of the filename
set statusline+=\ [%{&ff}] "file format
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%{fugitive#statusline()}
set statusline+=%m      "modified flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Always show status bar
set laststatus=2

if has('gui_running')
  set guioptions=
  "set guifont=PragmataPro:h16
  set guifont=Code\ New\ Roman:h16
endif

color oldlace
"color happy_hacking
"hi Cursor guifg=black guibg=green

" }}}

" {{{ Keymaps

" Colemak (Mod DH) keymappings because I can't take it anymore. J/K stop being
" a puss.
"noremap k h
"noremap K H
"noremap n gj
"noremap e gk
"noremap i l
"noremap I L


"" Put some things back in different spots
"noremap L N
"noremap l n
"noremap h i
"noremap H I
"noremap j e
"noremap J E
"noremap N J

"" Colemak
"nnoremap <C-k> <C-w>h
"nnoremap <C-n> <C-w>j
"nnoremap <C-e> <C-w>k
"nnoremap <C-i> <C-w>l

" Like C and D, yank from cursor to end of line
nnoremap Y y$
" Move over wrapped lines the same as normal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Use leader y/p/d to copy/paste/cut to system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

nnoremap <leader>n :noh<CR>

nnoremap <BS> :b#<CR>

nnoremap - :Explore<cr>

" conventional shifting
vnoremap < <gv
vnoremap > >gv

"Opposite of J
nnoremap \ i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>

" Copy the test to the clipboard
nnoremap <leader>yf :let @*="./scripts/test ". expand("%")<cr>:echo "Copied file name to clipboard"<cr>

" NERDCommenter
nmap <leader>; <Plug>NERDCommenterToggle
xmap <leader>; <Plug>NERDCommenterToggle

" Fugitive
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :GitGutterRevertHunk<CR>

" Magit
nnoremap <leader>gs :Magit<CR>


" CtrlP
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPBufTag<cr>

" vim-test
nmap <silent> <leader>TN :TestNearest<CR>
nmap <silent> <leader>TF :TestFile<CR>
nmap <silent> <leader>TL :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>
" }}}

" {{{ Autocmds
augroup ruby_things
  autocmd!
  autocmd FileType ruby :iabbrev bp binding.pry
  autocmd FileType ruby :iabbrev glbd GLBD.prettify ledger: ledger
  autocmd FileType ruby :iabbrev rap Rails.logger.ap
  autocmd FileType ruby :iabbrev ra* Rails.logger.ap "********************************************************************************"
  autocmd FileType ruby :set re=1
  autocmd Filetype ruby :setlocal iskeyword+=_
  " Highlight in red any binding.prys
  autocmd BufEnter *.rb syn match error contained "\<binding.pry\>"
  autocmd BufEnter *.rb syn match error contained "\<Rails.logger.ap\>"
augroup END

augroup misc_filetypes
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
  autocmd FileType javascript.jsx setlocal shiftwidth=4 tabstop=4
  autocmd FileType eruby setlocal shiftwidth=4 tabstop=4
  autocmd FileType c setlocal shiftwidth=4 tabstop=4
  autocmd FileType rust setlocal shiftwidth=4 tabstop=4
  autocmd FileType less setlocal shiftwidth=2 tabstop=2
  autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
  autocmd Filetype css setlocal iskeyword+=-

  au BufRead,BufNewFile *.es6.erb set filetype=javascript
  au BufRead,BufNewFile *.ex set filetype=elixir
  au BufRead,BufNewFile *.exs set filetype=elixir
  au BufRead,BufNewFile *.go set filetype=go
augroup END

augroup other
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  autocmd BufWritePre * :call StripTrailingWhitespace()

  " Keep any fugitive buffers from sticking around
  autocmd BufReadPost fugitive://* set bufhidden=delete
  set diffopt+=vertical

  " So there isn't always a netrw buffer left open
  autocmd FileType netrw setl bufhidden=wipe
  autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  normal `Z
endfunction

" }}}

" {{{ Plugin Settings
let ruby_no_expensive = 1 " No Slow Ruby

nnoremap <leader>a :Ack!<space>
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>
let g:ack_use_dispatch = 1 " Dispatch Ack
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --group\ --color=always

  "for ack.vim (cause it has async)
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"
" CtrlP
"
set runtimepath^=~/.vim/bundle/ctrlp.vim

set tags=/home/ryantroxler/code/fms/tags
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>
let g:ctrlp_match_window = 'max:20,results:50'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

set wildignore+=*.pdf,*.xml

" vim-test
let test#strategy = "terminal"

" }}}

" {{{ Misc Functions

" JSON formatter
"function! JsonFormat() range
  "a:firstline,a:lastlines/=>/:/
  "a:firstline,a:lastline!jq '.'
"endfunction

"command! -range JsonFormat <line1>,<line2>call JsonFormat()

" }}}

" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :

