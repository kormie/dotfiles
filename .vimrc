set nocompatible              " be iMproved, required
set nowrap
filetype off

set laststatus=2
inoremap :w<CR> <ESC>:w<CR>
" Fix screen disappearing
set t_ti= t_te=

" Make vim work with tmux
set term=screen-256color


command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'


" let tcommentreplacements_elm = {
"                 \     '/*': '#<{(|',
"                 \     '*/': '|)}>#',
"                 \ }
 let tcommentreplacements_elm = {
       \ }
let tcommentBlockElm = {
                \ 'commentstring': '{--%s --}',
                \ 'middle': '',
                \ 'rxbeg': '',
                \ 'rxend': '',
                \ 'rxmid': '',
                \ 'replacements': tcommentreplacements_elm
                \ }

let g:elm_format_autosave = 1
let g:tcomment_types = {"elm_block": tcommentBlockElm}


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'rizzatti/dash.vim'

Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'jiangmiao/auto-pairs'

Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'

Plugin 'udalov/kotlin-vim'

" UltiSnips plugins
Plugin 'SirVer/ultisnips'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
" End Snipmate

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'elmcast/elm-vim'

" ES6 Syntax
Plugin 'othree/yajs.vim'

Plugin 'mxw/vim-jsx'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'dag/vim2hs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'
call vundle#end()
filetype plugin indent on

nnoremap <LEADER>s :%s/\<<C-r><C-w>\>//g<LEFT><LEFT>
syntax on

nmap <LEADER>/ gcc
vmap <LEADER>/ <C-_>b

let g:jsx_ext_required = 0 "Allow JSX in normal JS files

" Set swapfile location
set directory=$HOME/.vim_swap_files
let g:UltiSnipsExpandTrigger="<tab>"

"let g:SuperTabDefaultCompletionType = "context"

let mapleader=','
map <LEADER>[ :tabprev<CR>
map <LEADER>] :tabnext<CR>

nmap <D-[> gT

imap jk 

nmap <LEADER>cc :call ToggleCrosshairs()<CR>
function! ToggleCrosshairs()
  if(&cursorcolumn)
    let newColumn = "nocursorcolumn"
  else
    let newColumn = "cursorcolumn"
  endif
  if(&cursorline)
    let newLine = "nocursorline"
  else
    let newLine = "cursorline"
  endif
  setl cursorline!
  setl cursorcolumn!
  echom newLine . " && " . newColumn
endfunc

function! NumberToggle()
  if(&relativenumber ==1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <silent><C-n> :call NumberToggle()<CR>

" Command-P customization
nmap <silent> <Leader><SPACE> :CtrlP<CR>
let g:ctrlp_custom_ignore = 'deps\|_build\|node_modules\|DS_Store\|git\|elm-stuff'
" Ignore Beam Files
let beamFileExtension = ",*.beam"
let g:CommandTWildIgnore=&wildignore . beamFileExtension

let g:vim_markdown_folding_disabled=1

" Bracket completion
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

"NerdTree
nmap <silent><Leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

set ignorecase smartcase
set hlsearch
set incsearch

set list
set listchars=trail:●
nmap <silent><LEADER>d :call CleanupExtraSpace()<CR>

function! CleanupExtraSpace()
  let position = getpos(".")
  %s/\s\+$//e
  call setpos(".", position)
endfunc
"Remove highlighting with return, but not in quickfix buffers (For ack)
nmap <silent>  :nohlsearch<CR>
autocmd BufReadPost quickfix nmap <buffer>  <CR>

autocmd BufReadPost * :retab <CR> :w <CR>

map <LEADER><LEADER> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

set backspace=indent,eol,start

set background=dark
colors hybrid

set expandtab
set tabstop=2
set shiftwidth=2

set backupdir=~/.vim/backups

set relativenumber
set nu

" Filetypes
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead .babelrc set filetype=javascript
au BufNewFile,BufRead Podfile set filetype=ruby

let g:airline_powerline_fonts = 1

let g:airline_theme = 'hybrid'

" xmpfilter
" nmap <buffer> <F5> <Plug>(xmpfilter-run)
" xmap <buffer> <F5> <Plug>(xmpfilter-run)
" imap <buffer> <F5> <Plug>(xmpfilter-run)

" nmap <buffer> <F4> <Plug>(xmpfilter-mark)
" xmap <buffer> <F4> <Plug>(xmpfilter-mark)
" imap <buffer> <F4> <Plug>(xmpfilter-mark)


