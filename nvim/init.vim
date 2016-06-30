
" set mapleader to space
let mapleader = "\<space>"

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'mileszs/ack.vim'
Plug 'kassio/neoterm'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'zhaocai/GoldenView.Vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'vimwiki/vimwiki'
Plug 'ddrscott/vim-side-search'
Plug 'henrik/vim-qargs'

" Language specific
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript.jsx' }
Plug 'rtroxler/vim-jsx', { 'for': 'javascript.jsx' }

" Colors
Plug 'w0ng/vim-hybrid'

call plug#end()

""""""""""
" Settings
""""""""""
set noswapfile

set cul

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

set tabstop=2		" The number of spaces count for a TAB.
set softtabstop=2	" The number of spaces inserted when typing TAB. If not expandtab, type TAB twice, will get one TAB.
set shiftwidth=2	" The number of spaces when auto-indent.
set expandtab		" Use the spaces only.
set smarttab            " Insert appropriate spaces in front of line according to shiftwidth, tabstop, softtabstop.
set autoindent
set smartindent

set ignorecase
set smartcase

" default substitute and others to global
set gdefault

set splitright

set list
set listchars=nbsp:∘,tab:➟\ ,trail:∘

" TRUE COLOR / 24Bit / 16M
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" User highlights for statusline
"""""""
" Color
"""""""
"autocmd ColorScheme *
"      \  highlight  User1    ctermfg=4     ctermbg=19                  |
"      \  highlight  User2    ctermfg=2     ctermbg=19                  |
"      \  highlight  User3    ctermfg=9     ctermbg=19    cterm=bold    |
"      \  highlight  User4    ctermfg=1     ctermbg=19                  |
"      \  highlight  User5    ctermfg=10    ctermbg=19    cterm=bold    |
"      \  highlight  User6    ctermfg=1     ctermbg=19    cterm=bold    |
"      \  highlight  User7    ctermfg=7     ctermbg=19    cterm=bold    |
"      \  highlight  Search   ctermfg=18    ctermbg=6     cterm=NONE    |
"      \  highlight  Error    ctermfg=9     ctermbg=none  cterm=italic  |
"      \  highlight  Comment                              cterm=italic


""""""""""""
" Statusline
""""""""""""
" COLORED
"set statusline=%t       "tail of the filename
" set statusline+=%1*%{expand('%:h')}/               " relative path to file's directory
" set statusline+=%5*%t%*
" set statusline+=\ %3*%m%*     "modified flag
" set statusline+=%=      "left/right separator
" set statusline+=%7*%{fugitive#statusline()}
" set statusline+=\ %y      "filetype
" set statusline+=\ %2*%L\ lines   "cursor line/total lines
" set statusline+=\ %1*%P    "percent through file

" NONCOLORED
 set statusline+=%{expand('%:h')}/               " relative path to file's directory
 set statusline+=%t%*
 set statusline+=\ %m%*     "modified flag
 set statusline+=%=      "left/right separator
 set statusline+=%{fugitive#statusline()}
 set statusline+=\ %y      "filetype
 set statusline+=\ %L\ lines   "cursor line/total lines
 set statusline+=\ %P    "percent through file

" Base16 things
"colorscheme base16-grayscale

set background=dark
colorscheme darktooth
"colorscheme Oldlace


""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""

tnoremap <C-h> <C-\><C-n><C-w>h
"tnoremap <C-j> <C-\><C-n><C-w>j
"tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <right> <C-w><
nnoremap <left> <C-w>>

nnoremap <leader>n :noh<CR>

"Use leader y/p/d to copy/paste/cut to system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
nnoremap <leader>yf :let @*="bin/rake test TEST=". expand("%")<cr>:echo "Copied file name to clipboard"<cr>

" map to gj/ gk for wrapped line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <leader>q <C-W>q

" conventional shifting
vnoremap < <gv
vnoremap > >gv

" switch to last buffer
nnoremap <BS> :b#<CR>

nnoremap <leader>vv :e ~/.config/nvim/init.vim<CR>

" To split a hash (or anything else for that matter) by comma
map <leader>, f,l\j

"Opposite of J
nnoremap \ i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>

nmap <silent> <leader>k  <Plug>GoldenViewSplit

nmap <leader>; <Plug>NERDCommenterToggle
xmap <leader>; <Plug>NERDCommenterToggle


nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>gr <Plug>GitGutterRevertHunk
nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk

" run set test lib
nnoremap <silent> <leader>ta :call neoterm#test#run('all')<cr>
nnoremap <silent> <leader>tf :call neoterm#test#run('file')<cr>
nnoremap <silent> <leader>ts :call neoterm#test#run('current')<cr>
nnoremap <silent> <leader>tr :call neoterm#test#rerun()<cr>
nnoremap <silent> <leader>tc :call neoterm#clear()<cr>
nnoremap <silent> <leader>tx :call neoterm#close()<cr>

nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gst<CR>
nnoremap <leader>gr :GitGutterRevertHunk<CR>

nnoremap <leader>x :bp \| :bd #<CR>

" Searching things
nnoremap <leader>/ :Ag<cr>
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>


map <leader><leader> :FZF<CR>
map <C-p> :FZF<CR>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>r :BTags<cr>
nnoremap <leader>T :Tags<cr>

nnoremap - :Explore<cr>


"""""""""""""""
" Plugin things
"""""""""""""""

let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:goldenview__enable_default_mapping = 0

let g:neoterm_position = 'vertical'

" For vim-ruby
let ruby_no_expensive=1

"let g:gitgutter_sign_column_always = 1

" nvim terminal scrollback
let g:terminal_scrollback_buffer_size = 100000

let g:jsx_ext_required = 0

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --group\ --color=always

  "for ack.vim (cause it has async)
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""
"" Autocmds
""""""""""""""""""""""""""""""""""""
augroup ruby_things
  autocmd!
  autocmd FileType ruby :iabbrev bp binding.pry
  autocmd FileType ruby :iabbrev rap Rails.logger.ap
  autocmd FileType ruby :set re=1
  autocmd Filetype ruby :setlocal iskeyword+=_
  " Highlight in red any binding.prys
  au BufEnter *.rb syn match error contained "\<binding.pry\>"
  au BufEnter *.rb syn match error contained "\<Rails.logger.ap\>"
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

aug CursorLine
    autocmd!
    autocmd VimEnter * setl cursorline
    autocmd WinEnter * setl cursorline
    autocmd BufWinEnter * setl cursorline
    autocmd WinLeave * setl nocursorline
aug END

autocmd BufWinEnter,WinEnter term://* startinsert

function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  normal `Z
endfunction


command! W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""
"" Other little hacks
""""""""""""""""""""""""""""""""""""

" solid underscore
"let &t_SI .= "\<Esc>[4 q"
" blinking block
let &t_EI .= "\<Esc>[1 q"

" solid line
"let &t_EI .= "\<Esc>[6 q"

"blinking line
let &t_SI .= "\<Esc>[5 q"
"let &t_EI .= "\<Esc>[5 q"

"""""""""""""""""""""""""""""""""""
""""""""""""""" FZF """""""""""""""
"""""""""""""""""""""""""""""""""""

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
  highlight fzf1 ctermfg=1 ctermbg=19
  highlight fzf2 ctermfg=2 ctermbg=19
  highlight fzf3 ctermfg=4 ctermbg=19
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
