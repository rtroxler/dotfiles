

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100

" map leader
" let mapleader = " "
map <space> <leader>
map <space><space> <leader><leader>
nmap <silent> <leader>vv :so ~/.vimrc<CR>

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

"Use leader y/p/d to copy/paste/cut to system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

"""""""
" Find and Replace !
"""""""
" :Ag -i thing_to_search_for  => brings up the Quicklist
" :Qdo %s/thing_to_search_for/whatever/gc | update
" (g being global, c being confirmation)
" update saves the files after



execute pathogen#infect()

" For pasting data from outside application into vim.
set pastetoggle=<F2>

" search
" set nohlsearch            " highlight search things
set ignorecase          " ignore case when searching
set smartcase           " only works when ignorecase on
set title

"""" INCSEARCH IS AWESOME
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


" encoding
set encoding=utf-8
set fileencodings=utf-8,latin-1,chinese

" User Interface
set guifont=DejaVu\ Sans\ Mono\ 6
set guioptions=
set ruler

set wildmenu            " Popup a window showing all matching command above command line when autocomplete.

" Better buffer management - hide buffers instead of closing them
"set hidden

set history=100
" Default history is only 20
set undolevels=100  " Use more levels of undo

" Speed things up a bit
set ttyfast
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
LuciusDark "Lucius comes in many flavors, can also set LuciousDarkLowContrast (High,Light, etc)
"
" Clear background so 256 color schemes work correctly
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    "   " render properly when inside 256-color tmux and GNU screen.
    "     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

hi Search       cterm=NONE ctermfg=236 ctermbg=LightBlue


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
"nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:➟\ ,eol:¬


" set region to United States English
set spelllang=en_us

set number

" for sudo editing
command W w !sudo tee % > /dev/null

" mouse support?
set mouse=a

" highlight current line
set cul

" map to gj/ gk for wrapped line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Faster mapping for substitute
nnoremap gs :%s/
xnoremap gs :s/

nnoremap <tab> %
vnoremap <tab> %


map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" no more :w, can now do ;w!
nnoremap ; :
nnoremap : ;

"Switching ` and ', for marks
noremap ` '
noremap ' `

" ^ is hard to reach
map 0 ^

nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>


" conventional shifting
:vnoremap < <gv
:vnoremap > >gv


" Tab Tab to cycle through vim panes
map <Tab><Tab> <C-W>w

"set jk to Esc
:inoremap jk <Esc>

let g:multi_cursor_quit_key='<Esc>'

" delete whole words (like Ctrl - Backspace) with Ctrl - w
:imap <C-BS> <C-W>

" [S]plit line (sister to [J]oin lines)
" cc still substitutes the line like S would
nnoremap S i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>
" switch to last buffer, like alt+tab
nnoremap <BS> :b#<CR>
nnoremap gl :bn<CR>
nnoremap gh :bp<CR>
nnoremap gk :Bdelete<CR>

nnoremap <leader>gr <Plug>GitGutterRevertHunk
nnoremap <leader>gs <Plug>GitGutterStageHunk
nnoremap <leader>gp <Plug>GitGutterPreviewHunk

"For CtrlP
set tags=/home/rtroxler/code/fms/tags
nnoremap <leader>fr :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>r :CtrlPBufTag<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtHistory(-1)':     ['<down>'],
    \ 'PrtHistory(1)':      ['<up<'],
    \ }

"EasyMotion, ,w to search forward -- ,b to search back
"let g:easymotion_leader_key='<leader>'
map s <Plug>(easymotion-s2)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_skipfoldedline = 0

let g:syntastic_ruby_exec = 'ruby2.1.2'

" Vim Airline always on
set laststatus=2
"Fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

runtime macros/matchit.vim

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


""""""""""""""""""""""""""""""""""""""""
""""" The Silver  Searcher
""""""""""""""""""""""""""""""""""""""""

 if executable('ag')
   " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  ".gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'


" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>s :Ag -i<Space>

"tmux line! Airline for tmux!
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#(whoami)',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%a',
      \'z'    : '#W %I:%M'}

let g:tmuxline_theme = {
    \   'a'    : [ 236, 103 ],
    \   'b'    : [ 253, 239 ],
    \   'c'    : [ 244, 236 ],
    \   'x'    : [ 244, 236 ],
    \   'y'    : [ 253, 239 ],
    \   'z'    : [ 236, 103 ],
    \   'win'  : [ 236, 103 ],
    \   'cwin' : [ 103, 236],
    \   'bg'   : [ 244, 236 ],
    \ }

let g:promptline_preset = {
        \'a' : [ promptline#slices#user() ],
        \'b' : [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" Cursor things, only works in xterm (removed if statement since I'm in tmux
" usually)
" solid underscore
let &t_SI .= "\<Esc>[4 q"
" solid block
let &t_EI .= "\<Esc>[2 q"


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


"Hardtime to get me to use easymotion more
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 4
nnoremap <F3> :HardTimeToggle<CR>
