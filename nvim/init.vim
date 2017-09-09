
" set mapleader to space
let mapleader = "\<space>"

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'henrik/vim-qargs'
Plug 'danchoi/ruby_bashrockets.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jreybert/vimagit'
Plug 'romainl/vim-qf'
Plug 'justinmk/vim-sneak'
Plug 'mtth/scratch.vim'

" Language specific
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript.jsx' }
Plug 'rtroxler/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }

" Colors
Plug 'rakr/vim-two-firewatch'
Plug 'arcticicestudio/nord-vim'
Plug 'noah/vim256-color'


call plug#end()

""""""""""
" Settings
""""""""""
set noswapfile

set nocul

set autowrite
set hidden

" For pasting data from outside application into vim.
set pastetoggle=<F2>

"save undos
set undofile
set undodir=~/.vim/undo
set undolevels=1000  " Use more levels of undo
set undoreload=10000

set nowrap "Line wrapping

set iskeyword+=_,$,@,%,#,-  " don't linebreak when encounter these characters.

set clipboard+=unnamed

set tabstop=2		" The number of spaces count for a TAB.
set softtabstop=2	" The number of spaces inserted when typing TAB. If not expandtab, type TAB twice, will get one TAB.
set shiftwidth=2	" The number of spaces when auto-indent.
set expandtab		" Use the spaces only.
set smarttab            " Insert appropriate spaces in front of line according to shiftwidth, tabstop, softtabstop.
set autoindent
set smartindent

set ignorecase
set smartcase

" Folding
function! RubyMethodFold(line)
  let line_is_method_or_end = synIDattr(synID(a:line,1,0), 'name') == 'rubyMethodBlock'
  let line_is_def = getline(a:line) =~ '\s*def '
  return line_is_method_or_end || line_is_def
endfunction

set foldexpr=RubyMethodFold(v:lnum)
"let g:ruby_fold = 1
"let g:ruby_foldable_groups = 'def do'
set foldlevel=10
set foldlevelstart=10
set foldclose=all
"set foldnestmax=1
"

set number

set mouse=a

" default substitute and others to global
set gdefault

set splitright

set list
set listchars=nbsp:∘,tab:➟\ ,trail:∘

" TRUE COLOR / 24Bit / 16M
"set termguicolors
set t_Co=256


set statusline=
set statusline+=%f
set statusline+=\ %m     "modified flag
set statusline+=%=      "left/right separator
set statusline+=%{fugitive#statusline()}
set statusline+=\ %y      "filetype
set statusline+=\ %L\ lines   "cursor line/total lines
set statusline+=\ %P    "percent through file

 "colorscheme ayu
"colorscheme nord
"colorscheme two-firewatch
"let g:two_firewatch_italics=1
"colorscheme darktooth
"colorscheme Oldlace
"colorscheme despacio
"colorscheme base16-green-screen
"colorscheme n0tch2k
"colorscheme base16-eighties

set background=dark
syntax on

""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""


" Terminal mappings handled down below
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <right> <C-w><
nnoremap <left> <C-w>>

nnoremap <leader>n :noh<CR>

nnoremap <leader>d :Dispatch<space>

"Use leader y/p/d to copy/paste/cut to system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" map to gj/ gk for wrapped line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Keep cursor centered when searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Tab things
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tq :tabclose<cr>

nmap <leader>q <C-W>q
nmap <leader>= <C-W>=
nmap <leader>- <C-W>_

" conventional shifting
vnoremap < <gv
vnoremap > >gv

" switch to last buffer
nnoremap <BS> :b#<CR>
imap <C-c> <ESC>

nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" To split a hash (or anything else for that matter) by comma
map <leader>, f,l\j

"Opposite of J
nnoremap \ i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>

nmap <leader>; <Plug>NERDCommenterToggle
xmap <leader>; <Plug>NERDCommenterToggle

 "To set min winwidth, vertical splits will resize to atleast be 70/60/50% width
nnoremap <C-w>7 <C-w>j:let &winwidth = &columns * 7 / 10<cr>
nnoremap <C-w>6 <C-w>j:let &winwidth = &columns * 6 / 10<cr>
nnoremap <C-w>5 <C-w>j:let &winwidth = &columns * 5 / 10<cr>

" Close buffer but keep window
nnoremap <leader>x :bp \| :bd #<CR>

"""""""""""""""
" Color things
"""""""""""""""
let ruby_no_expensive = 1 " THIS IS SUPER IMPORTANT
nnoremap <leader>c = :let &background = ( &background == "dark"? "light" : "dark" )<CR>


"""""""""""""""
" Plugin things
"""""""""""""""

" Gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gr <Plug>GitGutterRevertHunk
"nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk

" Fugitive
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :GitGutterRevertHunk<CR>

" Dispatch gcc
command! GccCurrent Dispatch gcc %:p -o %:r && ./%:r

" Magit
nnoremap <leader>gs :Magit<CR>
let g:magit_default_fold_level = 2

" Scratch
let g:scratch_persistence_file = '/Users/ryantroxler/.scratch.vim'
let g:scratch_insert_autohide = 0
let g:scratch_height = 15

" Searching things
nnoremap <leader>a :Ack!<space>
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>
let g:ack_use_dispatch = 1


map <C-p> :FZF<CR>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>r :BTags<cr>
nnoremap <leader>T :Tags<cr>

nnoremap - :Explore<cr>

let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

let g:neoterm_position = 'vertical'

" nvim terminal scrollback
let g:terminal_scrollback_buffer_size = 2000

let g:jsx_ext_required = 0

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --group\ --color=always

  "for ack.vim (cause it has async)
  let g:ackprg = 'ag --vimgrep'
endif

" Tmux send keys
" ts => tmux send-keys -t right 'args' C-m
"nnoremap <leader>it :!tsr bundle exec ruby -Itest <C-R>%<CR>
"nnoremap <leader>tf :!tmux send-keys -t right 'bin/rake test TEST="<C-R>%"' C-m<CR>
"nnoremap <leader>rt :!ts bin/rake test<CR> " I don't wanna map over <leader>r

" Copy the test to the clipboard
nnoremap <leader>yf :let @*="bin/rake test TEST=". expand("%")<cr>:echo "Copied file name to clipboard"<cr>

""""""""""""""""""""""""""""""""""""
"" Autocmds
""""""""""""""""""""""""""""""""""""
augroup ruby_things
  autocmd!
  autocmd FileType ruby :iabbrev bp binding.pry
  autocmd FileType ruby :iabbrev glbd GLBD.prettify facility: facility
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
  autocmd FileType go setlocal shiftwidth=4 tabstop=4
  autocmd FileType php setlocal shiftwidth=4 tabstop=4
  autocmd FileType rust setlocal shiftwidth=4 tabstop=4
  autocmd FileType less setlocal shiftwidth=2 tabstop=2
  autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
  autocmd Filetype css setlocal iskeyword+=-
  autocmd FileType rust let b:dispatch = 'cargo build'
  autocmd FileType elixir :iabbrev xp require IEx; IEx.pry

  "autocmd BufRead,BufNewFile setlocal textwidth=78
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
augroup END
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

"aug CursorLine
    "autocmd!
    "autocmd VimEnter * setl cursorline
    "autocmd WinEnter * setl cursorline
    "autocmd BufWinEnter * setl cursorline
    "autocmd WinLeave * setl nocursorline
"aug END

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
"func! s:mapMoveToWindowInDirection(direction)
    "func! s:maybeInsertMode(direction)
        "stopinsert
        "execute "wincmd" a:direction

        "if &buftype == 'terminal'
            "startinsert!
        "endif
    "endfunc

    "execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                "\ "<C-\\><C-n>"
                "\ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    "execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                "\ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
"endfunc
"for dir in ["h", "j", "l", "k"]
    "call s:mapMoveToWindowInDirection(dir)
"endfor

function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  normal `Z
endfunction


command! W w
command! Sw w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""
""""""""""""""" FZF """""""""""""""
"""""""""""""""""""""""""""""""""""

set rtp+=~/.config/nvim/syntax
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

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

" So the fzf statusline doesn't look stupid
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=1
  highlight fzf2 ctermfg=2
  highlight fzf3 ctermfg=4
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

colorscheme railscasts
" Customized railscast colors
hi Normal ctermbg=none
hi Visual ctermbg=6 ctermfg=0
hi Sneak ctermbg=150 ctermfg=0
hi Search ctermbg=150 ctermfg=0
hi LineNr ctermbg=none ctermfg=242
hi CursorLine ctermbg=235
hi StatusLine cterm=bold,reverse
hi StatusLineNc cterm=bold
hi VertSplit cterm=none ctermfg=0
hi GitGutterAdd ctermbg=none
hi GitGutterDelete ctermbg=none
hi GitGutterChange ctermbg=none
