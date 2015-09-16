
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
set so=2
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


" vim-plug is da bomb
call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'ludovicchabant/vim-gutentags'
Plug 'henrik/vim-qargs'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'noah/vim256-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'danchoi/ruby_bashrockets.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

call plug#end()

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
" phoenix (Maybe edit it to make give it a tiny bit more color?)
" atom-term
" "
colorscheme solarized
"LuciusDark "Lucius comes in many flavors, can also set LuciousDarkLowContrast (High,Light, etc)

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
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.es6.erb set filetype=javascript
au BufRead,BufNewFile *.go set filetype=go

""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""


" Remap to let C-c give abbr
imap <c-c> <esc>

nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

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

"send all changes to the trash (don't copy them into register)
nnoremap c "_c
vnoremap c "_c

map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>q <C-W>q
map <leader>v <C-W>v
map <leader>x <C-W>x

""""""""""""""""""""
" Vim Tmux Navigator
""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

execute "set <M-h>=\eh"
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
""nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


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

" For using the Source, Luke!
nnoremap <leader>cd :lcd %:p:h
nnoremap <C-g> :CtrlP :pwd<CR>

"Not sure why I have to remap this :(
nnoremap <C-]> :tag <C-R><C-W>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gr <Plug>GitGutterRevertHunk
nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk

"Opposite of J
nnoremap \ i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>

"Sending tests to tmux (Itest, current test file)
" ts => tmux send-keys -t right 'args' C-m
nnoremap <leader>it :!ts bundle exec ruby -Itest <C-R>%<CR>
"nnoremap <leader>rt :!ts rake test<CR>


let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

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
let g:ctrlp_match_window = 'max:20,results:50'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|\.settings|tmp/continusync|node_modules|\.sass-cache|cache|\.rsync_cache|test/reports|test/fixtures)$'

set wildignore+=*.pdf,*.xml


""""""""""""""""""""""""""""""""""""""""
""""" The Silver  Searcher
""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --group\ --color=always

  " Use ag in CtrlP for listing files. Lightning fast and respects
  ".gitignore
  " DON"T DO THIS, Because it ignores my custom_ignore which, ignoring
  " fixtures makes things so much faster.
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'


" bind leader s to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>s :Ag<Space>''<left>
nnoremap <leader>S :Ag -C 2<Space>
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Color things
:hi Search ctermfg=NONE ctermbg=NONE cterm=underline


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
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4

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

function MyTabLabel(n)
	  let buflist = tabpagebuflist(a:n)
	  let winnr = tabpagewinnr(a:n)
	  return buflist[winnr - 1] . ') ' . bufname(buflist[winnr - 1])
endfunction


" FZF things, hybrid with CtrlP (cause CtrlP's MRU is much better..)

nnoremap <leader>r :FZFTagsBuffer<CR>
nnoremap <C-t> :FZFTags<CR>

command! -bar FZFTags if !empty(tagfiles()) |
            \ call fzf#run({
            \   'source': 'sed ''/^\\!/ d; s/^\([^\t]*\)\t.*\t\(\w\)\(\t.*\)\?/\2\t\1/; /^l/ d'' ' . join(tagfiles()) . ' | uniq',
            \   'tmux_height': '20%',
            \   'sink': function('<SID>tag_line_handler'),
            \ }) | else | call MakeTags() | FZFTags | endif

command! FZFTagsBuffer call fzf#run({
            \   'source': 'ctags -f - --sort=no ' . bufname("") . ' | sed ''s/^\([^\t]*\)\t.*\t\(\w\)\(\t.*\)\?/\2\t\1/'' | sort -k 1.1,1.1 -s',
            \   'sink': function('<SID>tag_line_handler'),
            \   'options': '--tac',
            \   'tmux_height': '20%'
            \ })

function! s:tag_line_handler(l)
    let keys = split(a:l, '\t')
    exec 'tag' keys[1]
endfunction

function! MakeTags()
    echo 'Preparing tags...'
    call system('ctags -R')
    echo 'Tags done'
endfunction


"""""""""""""""""
" Javascript :(
""""""""""""""""

let g:jsx_ext_required = 0

