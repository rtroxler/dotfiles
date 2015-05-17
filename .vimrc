
set history=100

" map leader
let mapleader = " "
map <space><space> <leader><leader>

" backspace key behavior
set backspace=eol,start,indent
set wrap

" set to auto read when a file is changed from the outside.
set autoread

" Set 7 lines to the cursor, when moving vertically using t, n
set so=7
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"""""""
" Find and Replace !
"""""""
" :Ag -i thing_to_search_for  => brings up the Quicklist
" :Qdo %s/thing_to_search_for/whatever/gc | update
" (g being global, c being confirmation)
" update saves the files after

" Really need to switch to vundle
execute pathogen#infect()

" For pasting data from outside application into vim.
set pastetoggle=<F2>

" search
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

"save undos
set undofile
set undodir=~/.vim/undo
set undolevels=1000  " Use more levels of undo
set undoreload=10000

" Speed things up a bit
set ttyfast
set ttyscroll=3
set lazyredraw

" default substitute and others to global
set gdefault

" color scheme
" "black_angus - matrix -y
" "monokai - unoriginal, but good looking
" "zenburn, easy on the eyes, light orange/greys/greens
" xoria256
" "
colorscheme lucius
LuciusLightHighContrast "Lucius comes in many flavors, can also set LuciousDarkLowContrast (High,Light, etc)

" Clear background so 256 color schemes work correctly
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  "   " render properly when inside 256-color tmux and GNU screen.
  "     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" no back up/swp files
set nobackup
set noswapfile
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " store swap files here


set showmatch 		" show matching brackets.
set matchtime=1         " the length of time to show matching paren.

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
"set noshowmode

set autowrite		" Automatically save before commands like :next and :make

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=nbsp:∘,tab:➟\ ,trail:∘

runtime macros/matchit.vim

set laststatus=2

set statusline=%F       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}] "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%{fugitive#statusline()}
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


" set region to United States English
set spelllang=en_us

"set relativenumber
set number

" mouse support?
set mouse=a

" highlight current line
set cul

autocmd BufRead,BufNewFile setlocal textwidth=78

""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""

" Remap to let C-c give abbr
imap <c-c> <esc>

"Use leader y/p/d to copy/paste/cut to system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Comment with <leader>/
nmap <leader>/ <Plug>NERDCommenterToggle
xmap <leader>/ <Plug>NERDCommenterToggle

"Alternate file for rails.vim
nmap <leader>a :A<CR>

" map to gj/ gk for wrapped line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>q <C-W>q
map <leader>v <C-W>v
map <leader>x <C-W>x

" no more :w, can now do ;w!
nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;

"Switching ` and ', for marks
noremap ` '
noremap ' `

nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

nnoremap - :Explore<cr>

" conventional shifting
:vnoremap < <gv
:vnoremap > >gv

imap <c-c> <esc>

" delete whole words (like Ctrl - Backspace) with Ctrl - w
:imap <C-BS> <C-W>

" Complete lines
inoremap <C-d> <C-x><C-l>

" set Y to same as D
nnoremap Y  y$
"
" switch to last buffer, like alt+tab
nnoremap <BS> :b#<CR>

nnoremap <leader>vv :e ~/.vimrc<CR>

"Rails projects have database.yml in .gitignore so CtrlP won't find them
"I could probably add them to CtrlP manually, but for now this works
nnoremap <leader>vd :e config/database.yml<cr>

nnoremap <leader>vg :e ~/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems<CR>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gr <Plug>GitGutterRevertHunk
nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk

"Opposite of J
nnoremap \ i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>

"""""""""""""""""""""""""
" INCSEARCH IS AWESOME
"""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""""""""""""""""""
" CtrlP
""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

set tags=/home/rtroxler/code/fms/tags
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>r :CtrlPFunky<CR>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_ruby_classes = 0
let g:ctrlp_funky_multi_buffers = 0
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_match_window = 'max:20,results:50'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|\.settings|\.sass-cache|cache|\.rsync_cache|test/fixtures)$'

set wildignore+=*.pdf

""""""""""""""""""""""""""""""""""""""""
""""" The Silver  Searcher
""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects
  ".gitignore
  " DON"T DO THIS, Because it ignores my custom_ignore which, ignoring
  " fixtures makes things so much faster.
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'


" bind leader s to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>s :Ag -i<Space>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


:hi Search ctermfg=NONE ctermbg=NONE cterm=underline
:hi MatchParen cterm=NONE ctermbg=green ctermfg=blue


""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

""""""""""""""""""""""""""""""
"""" Session management """"""
""""""""""""""""""""""""""""""

" where do you want to save sessions?
let g:session_dir = $HOME."/.vimsessions"

" Save sessions whenever vim closes
autocmd VimLeave * call SaveSession()

" Saves the session to session dir. Creates session dir if it doesn't
" yet exist. Sessions are named after servername paameter
function! SaveSession()

  " get the server (session) name
  let s = v:servername

  " create session dir if needed
  if !isdirectory(g:session_dir)
    call mkdir(g:session_dir, "p")
  endif

  " save session using the server name
  execute "mksession! ".g:session_dir."/".s.".session.vim"
endfunc

" Load session when vim is opened
autocmd VimEnter * nested call OpenSession()

" Open a saved session if there were no file-names passed as arguments
" The session opened is based on servername (session name). If there
" is no session for this server, none will be opened
function! OpenSession()

  " check if file names were passed as arguments
  if argc() == 0

    let sn = v:servername
    let file = g:session_dir."/".sn.".session.vim"

    " if session file exists, load it
    if filereadable(file)
      execute "source ".file
    endif
  endif
endfunc

" So there isn't always a netrw buffer left open
autocmd FileType netrw setl bufhidden=wipe

""""""""""""""""""""""""""""""""""""
"" Other little hacks
""""""""""""""""""""""""""""""""""""

" Abbreviations
autocmd FileType ruby :iabbrev bp binding.pry
autocmd FileType ruby :iabbrev ap Rails.logger.ap

" Highlight in red any binding.prys
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<Rails.logger.ap\>"

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

" Cursor things, only works in xterm (removed if statement since I'm in tmux
" usually)
" solid underscore
let &t_SI .= "\<Esc>[4 q"
" solid block
let &t_EI .= "\<Esc>[2 q"

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

" for sudo editing
command W w !sudo tee % > /dev/null


"""""""""""""""""
" Javascript :(
""""""""""""""""

let g:jsx_ext_required = 0
