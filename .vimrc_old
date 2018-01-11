
set history=100


" set mapleader to space
let mapleader = "\<space>"
map <space><space> <leader><leader>

" backspace key behavior
set backspace=eol,start,indent
set wrap

" set to auto read when a file is changed from the outside.
set autoread

" Set 2 lines to the cursor, when moving vertically using t, n
set so=2
"set cursorline
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
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'ludovicchabant/vim-gutentags'
Plug 'henrik/vim-qargs'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'airblade/vim-gitgutter'
Plug 'noah/vim256-color'
Plug 'danchoi/ruby_bashrockets.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
"Plug 'kristijanhusak/vim-hybrid-material'
" testing them out

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
"set ttyscroll=3
set lazyredraw

" removes the delay after hitting esc / C-[
set noesckeys
set ttimeout
set ttimeoutlen=250
set notimeout

" no more annoying bell
set visualbell

" So window is atleast 100 cols in vertical split
set winwidth=100

" default substitute and others to global
set gdefault

" color scheme
" "black_angus - matrix -y
" "monokai - unoriginal, but good looking
" "zenburn, easy on the eyes, light orange/greys/greens
" xoria256
" phoenix (Maybe edit it to make give it a tiny bit more color?)
" atom-term
" Tomorrow-Night
" "
let base16colorspace=256
colorscheme base16-solarized
set background=light
let g:enable_bold_font = 1
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
"set cindent            " cindent will disable smartindent, but only for C-like programminge
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

" Keep any fugitive buffers from sticking around
autocmd BufReadPost fugitive://* set bufhidden=delete

" set region to United States English
set spelllang=en_us

"set relativenumber
set number

" mouse support?
set mouse=a

" highlight current line
"set cul

autocmd BufRead,BufNewFile setlocal textwidth=78
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.es6.erb set filetype=javascript
au BufRead,BufNewFile *.ex set filetype=elixir
au BufRead,BufNewFile *.exs set filetype=elixir
au BufRead,BufNewFile *.go set filetype=go

""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""


" Remap to let C-c give abbr
imap <c-c> <NOP>
vmap <c-c> <NOP>

nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

"Use leader y/p/d to copy/paste/cut to system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
nnoremap <leader>yf :let @*=expand("%")<cr>:echo "Copied file name to clipboard"<cr>

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

nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <leader>q <C-W>q
nmap <leader>v <C-W>v
nmap <leader>x <C-W>x


"Tabs
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprev<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>te :tabedit<CR>
nnoremap <leader>tx :tabclose<CR>


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
" switch to last buffer
nnoremap <BS> :b#<CR>

nnoremap <leader>vv :e ~/.vimrc<CR>

"Rails projects have database.yml in .gitignore so CtrlP won't find them
"I could probably add them to CtrlP manually, but for now this works
nnoremap <leader>vd :e config/database.yml<cr>

"nnoremap <leader>vg :e ~/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems<CR>

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
"nnoremap <leader>it :!tsr bundle exec ruby -Itest <C-R>%<CR>
"nnoremap <leader>it :!tmux send-keys -t right 'bundle exec ruby -Itest <C-R>%' C-m<CR>
"nnoremap <leader>rt :!ts rake test<CR>

let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

" To split a hash (or anything else for that matter) by comma
map <leader>, f,l\j

set hlsearch

""""""""""""""""""
" CtrlP
""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

set tags=/home/rtroxler/code/fms/tags
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_match_window = 'max:20,results:50'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|\.settings|tmp/continusync|node_modules|\.sass-cache|cache|\.rsync_cache|test/reports|test/fixtures)$'

set wildignore+=*.pdf,*.xml
let g:ctrlp_clear_cache_on_exit = 0

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
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore node_modules
      \ --ignore "**/*.pyc"
      \ -g ""'
endif
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'


" bind leader s to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>s :Ag<Space>''<left>
nnoremap <leader>S :Ag -C 2<Space>
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Color things
:hi Search ctermfg=NONE ctermbg=NONE cterm=underline
" For solarized light so the status line looks better
:hi StatusLine ctermfg=15


""""""""""""""""""""""""""""""
"""" Session management """"""
""""""""""""""""""""""""""""""

" where do you want to save sessions?
let g:session_dir = $HOME."/.vimsessions"

" So there isn't always a netrw buffer left open
autocmd FileType netrw setl bufhidden=wipe

""""""""""""""""""""""""""""""""""""
"" Other little hacks
""""""""""""""""""""""""""""""""""""

" Abbreviations
autocmd FileType ruby :iabbrev bp binding.pry
autocmd FileType ruby :iabbrev rap Rails.logger.ap

" Highlight in red any binding.prys
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<Rails.logger.ap\>"

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType eruby setlocal shiftwidth=4 tabstop=4
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
command! W w !sudo tee % > /dev/null

function! MyTabLabel(n)
	  let buflist = tabpagebuflist(a:n)
	  let winnr = tabpagewinnr(a:n)
	  return buflist[winnr - 1] . ') ' . bufname(buflist[winnr - 1])
endfunction


" FZF things, hybrid with CtrlP (cause CtrlP's MRU is much better..)
"
set rtp+=~/.fzf

" Search all tags
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
nnoremap <C-t> :Tags<CR>


"""""""""""""""""""""""""""""""""""
" FZF, jump to tag in current buffer
"""""""""""""""""""""""""""""""""""
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
nnoremap <leader>r :BTags<CR>


"""""""""""""""""
" Javascript :(
""""""""""""""""

let g:jsx_ext_required = 0

" Elixir
nnoremap <leader>e :!elixir %:p<CR>
