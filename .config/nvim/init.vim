" scriptencoding utf-8
" Josh's vim configuration (http://github.com/knewter/dotfiles)

" Table of Contents
" 1) Basics #basics
"   1.1) Tabs #tabs
"   1.2) Format Options #format-options
"   1.3) Leader #leader
"   1.4) Omni #omni
"   1.5) UI Basics #ui-basics
" 2) Plugins #plugins
"   2.1) Filetypes #filetypes
"   2.2) Utilities #utilities
"   2.3) UI Plugins #ui-plugins
"   2.4) Code Navigation #code-navigation
" 3) UI Tweaks #ui-tweaks
"   3.1) Theme #theme
" 4) Navigation #navigation

"""""""""""""" Basics #basics
""" Tabs #tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

""" Format Options #format-options
set formatoptions=tcrq
set textwidth=80

""" Handling backup copies
" make a copy of the file and overwrite the original one
set backupcopy=yes

""" Leader #leader
" Use space for leader
let g:mapleader=','
" Double backslash for local leader
" let g:maplocalleader='\\'

""" omni #omni
" enable omni syntax completion
set omnifunc=syntaxcomplete#Complete
set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

""" UI Basics #ui-basics
" turn off mouse
set mouse=a
set mousemodel=popup_setpos

" NOTE: I stopped highlighting cursor position because it makes redrawing
" super slow.
" set cursorline
" set cursorcolumn

"Start scrolling when we're 8 lines away from the top and bottom
set scrolloff=8
"Start scrolling when we're 8 lines away from the left and right
set sidescrolloff=15
set sidescroll=1
set nowrap

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase smartcase
" Ignore case when searching lowercase
set smartcase

" Set the title of the iterm tab
set title

" Line numbering
set number
set relativenumber

set list
set listchars=trail:●
nmap <silent><LEADER>d :call CleanupExtraSpace()<CR>

function! CleanupExtraSpace()
  let position = getpos(".")
  %s/\s\+$//e
  call setpos(".", position)
endfunc
"Remove highlighting with return, but not in quickfix buffers (For ack)

map <LEADER>[ :tabprev<CR>
map <LEADER>] :tabnext<CR>
imap jk 

""" Undo #undo
" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
if isdirectory($HOME . '/.config/nvim/undo') == 0
  :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
endif
set undodir=./.vim-undo//
set undodir+=~/.vim/undo//
set undofile

"""""""""""""" End Basics

"""""""""""""" Plugins #plugins
call plug#begin()
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'Quramy/tsuquyomi', { 'do': 'make -f make_mac.mak' }
Plug 'mhartington/nvim-typescript'

Plug 'bumaociyuan/vim-swift'

" Elm
Plug 'dustinfarris/elm-vim'
  let g:elm_format_autosave = 1
  let g:elm_detailed_complete = 1
  let g:elm_syntastic_show_warnings = 1
  let g:elm_format_fail_silently = 1
  let g:elm_browser_command = 'open'
  let g:elm_make_show_warnings = 1
  let g:elm_setup_keybindings = 1

""" Filetypes #filetypes
" Polyglot loads language support on demand!
 Plug 'sheerun/vim-polyglot'
   let g:polyglot_disabled = ['elm']


" HTML / JS / CSS
Plug 'othree/html5.vim'
Plug 'vim-scripts/html-improved-indentation'
Plug 'pangloss/vim-javascript'
Plug 'flowtype/vim-flow'
  let g:flow#autoclose = 1
  let g:flow#enable = 0
Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
""" Add support for ANSI colors - this has variously been necessary and caused
""" problems, no clue what's up there...
  Plug 'powerman/vim-plugin-AnsiEsc'

" Phoenix
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features

" Fuse
Plug 'BeeWarloc/vim-fuse'

" Markdown
function! NpmInstallAndUpdateRemotePlugins(info)
  !npm install
  UpdateRemotePlugins
endfunction
Plug 'neovim/node-host', { 'do': function('NpmInstallAndUpdateRemotePlugins') }
Plug 'vimlab/mdown.vim', { 'do': function('NpmInstallAndUpdateRemotePlugins') }

""" Utilities #utilities
" Enable opening a file to a given line with file:lineno
Plug 'bogado/file-line'

" Vim wiki :)
Plug 'vimwiki/vimwiki'
  let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Easily toggle quickfix and locations lists with <leader>l and <leader>q
Plug 'milkypostman/vim-togglelist'

" Reformat source code
Plug 'sbdchd/neoformat'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = ['file', 'neosnippet']
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#input_patterns = {}

  " Elm support
  " h/t https://github.com/ElmCast/elm-vim/issues/52#issuecomment-264161975
  let g:deoplete#sources.elm = ['omni'] + g:deoplete#sources._
  let g:deoplete#omni#functions.elm = ['elm#Complete']
  let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
  let g:deoplete#disable_auto_complete = 1

Plug 'ervandew/supertab'
  " let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabContextDefaultCompletionType = ""
  let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
  let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:"]

" Add comment textobjects (I really want to reformat comments without affecting
" the next line of code)
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
  " Example: Reformat a comment with `gqac` (ac is "a comment")

" EditorConfig support
Plug 'editorconfig/editorconfig-vim'

" Jump between quicklist, location (syntastic, etc) items with ease, among other things
Plug 'tpope/vim-unimpaired'

" Line commenting
Plug 'tomtom/tcomment_vim'
" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc
  " By default, `gc` will toggle comments

" Plug 'janko-m/vim-test'                " Run tests with varying granularity
"   nmap <silent> <leader>t :TestNearest<CR>
"   nmap <silent> <leader>T :TestFile<CR>
"   nmap <silent> <leader>a :TestSuite<CR>
"   nmap <silent> <leader>l :TestLast<CR>
"   nmap <silent> <leader>g :TestVisit<CR>
"   " run tests in neoterm
"   let g:test#strategy = 'neoterm'
"   " I use spinach, not cucumber!
"   let g:test#ruby#cucumber#executable = 'spinach'

" Asynchronous file linter
Plug 'w0rp/ale'
  " wait a bit before checking syntax in a file, if typing
  let g:ale_lint_delay = 2000
  " Use global eslint
  let g:ale_javascript_eslint_use_global = 0
  let g:ale_javascript_eslint_suppress_missing_config = 0

  let g:ale_completion_enabled = 1
  " Only use es6 for js
  let g:ale_linters = {
        \ 'javascript': ['eslint', 'flow'],
        \ 'typescript': ['tslint', 'tsserver'],
        \ 'ocaml': ['merlin'],
        \ 'haskell': ['hlint', 'ghc-mod', 'hdevtools'],
        \ 'ruby': ['rubocop']
        \}
  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['prettier', 'eslint']
  let g:ale_fixers['typescript'] = ['prettier', 'tslint']
  let g:ale_open_list = 1
  let g:ale_set_quickfix = 0
  let g:ale_ruby_rubocop_options = '-c .ruby-style.yml'
  nnoremap <leader>f :ALEFix<cr>
  let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
  let g:ale_lint_on_save = 1                                                      "Lint when saving a file
  let g:ale_sign_error = '✖'                                                      "Lint error sign
  let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
  let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts

  "let g:jsx_ext_required = 1                                                      "Force jsx extension for jsx filetype
  let g:javascript_plugin_jsdoc = 1

" toplevel tag browswing
Plug 'majutsushi/tagbar'

" tmux integration
Plug 'jpalardy/vim-slime'
  let g:slime_target = "tmux"
  let g:slime_paste_file = tempname()

" git support from dat tpope
Plug 'tpope/vim-fugitive'

" github support from dat tpope
Plug 'tpope/vim-rhubarb'

" vim interface to web apis.  Required for gist-vim
Plug 'mattn/webapi-vim'

" create gists trivially from buffer, selection, etc.
Plug 'mattn/gist-vim'
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype = 2
  let g:gist_post_private = 1
  if has('macunix')
    let g:gist_clip_command = 'pbcopy'
  endif

" visualize your undo tree
Plug 'sjl/gundo.vim'
  nnoremap <F5> :GundoToggle<CR>

" org-mode
Plug 'jceb/vim-orgmode'
  let g:org_agenda_files = ['~/org/index.org']
  let g:org_export_emacs = '/usr/local/bin/emacs'
  let g:org_export_verbose = 1

" universal text linking
Plug 'vim-scripts/utl.vim'

" allow portions of a file to use different syntax
Plug 'vim-scripts/SyntaxRange'

" increment dates like other items
Plug 'tpope/vim-speeddating'

" calendar application
Plug 'itchyny/calendar.vim'
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1

" nicer api for neovim terminal
Plug 'kassio/neoterm'


""" UI Plugins #ui-plugins
" Molokai theme makes me cozy
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'fmoralesc/molokayo'
" Try out the ayu theme - https://github.com/ayu-theme/ayu-vim
Plug 'ayu-theme/ayu-vim'
" Solarized - variant with specific terminal support
Plug 'lifepillar/vim-solarized8'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  "let g:airline_theme = 'luna'
  "let g:airline_theme = 'lucius'
  let g:airline_theme = 'hybrid'
  let g:bufferline_echo = 0
  let g:airline_powerline_fonts=0
  let g:airline_enable_branch=1
  let g:airline_enable_syntastic=1
  let g:airline_branch_prefix = '⎇ '
  let g:airline_paste_symbol = '∥'
  let g:airline#extensions#tabline#enabled = 0


""" Code Navigation #code-navigation
" fzf fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'window': 'enew' }
  nnoremap <silent> <C-P> :call fzf#run(fzf#wrap({'source': "find . -type d
        \ \\( -path ./**/*node_modules -o -path ./.git -o -path ./webpack/*.tmp \\) -prune
        \ -o -type f -iname '*' -print"}))<cr>
  nnoremap <silent> <leader>a :Ag<cr>
  noremap <silent> <leader>m :Buffers<cr>
  augroup localfzf
    autocmd!
    autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
    autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
    autocmd VimEnter * command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
  augroup END

" Open files where you last left them
Plug 'dietsche/vim-lastplace'

 " Execute code checks, find mistakes, in the background
 " Plug 'neomake/neomake'
   " Run Neomake when I save any buffer
"    augroup localneomake
"      autocmd! BufWritePost * Neomake
"    augroup END
   " Don't tell me to use smartquotes in markdown ok?
"    let g:neomake_markdown_enabled_makers = []

   " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
"    let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']
"    function! NeomakeCredoErrorType(entry)
"      if a:entry.type ==# 'F'      " Refactoring opportunities
"        let l:type = 'W'
"      elseif a:entry.type ==# 'D'  " Software design suggestions
"        let l:type = 'I'
"      elseif a:entry.type ==# 'W'  " Warnings
"        let l:type = 'W'
"      elseif a:entry.type ==# 'R'  " Readability suggestions
"        let l:type = 'I'
"      elseif a:entry.type ==# 'C'  " Convention violation
"        let l:type = 'W'
"      else
"        let l:type = 'M'           " Everything else is a message
"      endif
"      let a:entry.type = l:type
"    endfunction

"    let g:neomake_elixir_mycredo_maker = {
"          \ 'exe': 'mix',
"          \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
"          \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
"          \ 'postprocess': function('NeomakeCredoErrorType')
"          \ }

" Easily manage tags files
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache'

" navigate up a directory with '-' in netrw, among other things
Plug 'tpope/vim-vinegar'

" vifm file manager as the default vim file management tool
" Plug 'vifm/neovim-vifm'
" NOTE: I don't get highlighting with this and it's hard to see where the
" selection is

" Interaction with tmux
" Plug 'benmills/vimux'

" Surrounds blocks with delimeters
Plug 'tpope/vim-surround'

" Vim sugar for commandline commands
Plug 'tpope/vim-eunuch'

" Use silver searcher in vim
Plug 'mileszs/ack.vim'
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack


call plug#end()

"" Plugin configuration that has to run after plug#end

"""""""""""""" End Plugins


"""""""""""""" UI Tweaks #ui-tweaks
""" Theme #theme
if (empty($TMUX))
  if (has('termguicolors'))
    set termguicolors
  endif
endif

syntax enable
set background=dark
colors hybrid

""" Keyboard
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <silent> <cr> :nohlsearch<cr>

" NO ARROW KEYS COME ON
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Custom split opening / closing behaviour
"map <C-N> :vsp<CR><C-P>
map <C-C> :q<CR>
" Custom tab opening behaviour
map <leader>n :tabnew .<CR><C-P>
nmap <leader><SPACE> <C-P>

" reselect pasted content:
noremap gV `[v`]

nmap <leader>cc :set cursorline!<Bar>set cursorcolumn!<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

nnoremap # :echo "USE * or g*"<cr>

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode "Cuz we use airline

" Split to the bottom, not tom
set splitbelow

" Split to the right, not left
set splitright

" When substituting show as it happens
set inccommand=nosplit

" Show better vertical split separators
set fillchars+=vert:\│

" Get rid of folds
set nofoldenable

" Show where the 80th line is
" set colorcolumn=80

" Open the alternate file
" map ,, <C-^>

nmap <silent><leader>t :call GetFlow()<cr>

" Move around linting list
nmap <C-n> <Plug>(ale_next_wrap)
"nmap <C-P> <Plug>(ale_previous_wrap)

" Makes foo-bar considered one word
set iskeyword+=-

""" Auto Commands ====================== #auto-cmd
function! GetFlow()
  let pos = line('.').' '.col('.')
  let path = ' --path '.fnameescape(expand('%'))
  let cmd = g:flow#flowpath.' type-at-pos --quiet '.pos.path
  let stdin = join(getline(1,'$'), "\n")

  let output = ''.system(cmd, stdin)
  let output = substitute(output, '\n.*$', '', '')
  echo output
endfunction

" A helper function to restore cursor position, window position, and last search
" after running a command.  From:
" http://stackoverflow.com/questions/15992163/how-to-tell-vim-to-auto-indent-before-saving
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent()
  call Preserve('normal gg=G')
endfunction

""""" Filetypes ========================
augroup erlang
  autocmd!
  autocmd BufNewFile,BufRead *.erl setlocal tabstop=4
  autocmd BufNewFile,BufRead *.erl setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.erl setlocal softtabstop=4
  autocmd BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup vimrc
  autocmd!
augroup END
autocmd vimrc FocusGained,BufEnter * checktime

" augroup elixir
"   autocmd!
"   " autocmd BufWritePre *.ex call Indent()
"   " autocmd BufWritePre *.exs call Indent()
"   "
"   " Sadly, I can't enable auto-indent for elixir because it messes up my heredoc
"   " indentation for code sections and it has a couple of other issues :(
"   autocmd BufNewFile,BufRead *.ex setlocal formatoptions=tcrq
"   autocmd BufNewFile,BufRead *.exs setlocal formatoptions=tcrq
" augroup END

augroup elm
  autocmd!
  autocmd BufNewFile,BufRead *.elm setlocal tabstop=4
  autocmd BufNewFile,BufRead *.elm setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.elm setlocal softtabstop=4
augroup END

augroup dotfiles
  autocmd!
  autocmd BufNewFile,BufRead *.envrc setlocal filetype=sh
  autocmd BufNewFile,BufRead *.eslintrc setlocal filetype=json
augroup END

augroup es6
  autocmd!
  autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript
  autocmd BufNewFile,BufRead *.es6.erb setlocal filetype=javascript
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType markdown setlocal formatoptions=tcrq
  autocmd FileType markdown setlocal spell spelllang=en
augroup END

augroup viml
  autocmd!
  autocmd FileType vim setlocal textwidth=80
  autocmd FileType vim setlocal formatoptions=tcrq
augroup END

augroup js
  autocmd!
  autocmd BufWritePre silent! *.js undojoin | ALEFix
augroup END

augroup ocaml
  autocmd!
  autocmd BufWritePre *.ml,*.mli undojoin | ALEFix
augroup END

autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
      \ endif
""""" End Filetypes ====================

""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc

let g:python3_host_prog='/usr/local/bin/python3'

augroup whitespace
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END
""""" End Normalization ================
""" End Auto Commands ==================

""" Navigation ====================== #navigation
" Navigate terminal with C-h,j,k,l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Navigate splits with C-h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <BS> <C-w>h
" Have to add this because hyperterm sends backspace for C-h

" Navigate tabs with leader+h,l
" nnoremap <leader>h :tabprev<cr>
" nnoremap <leader>l :tabnext<cr>
""" End Navigation ==================

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

Plug 'reasonml-editor/vim-reason-plus'
set hidden

let g:LanguageClient_serverCommands = {
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ }

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exec "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

let g:python3_host_prog="/usr/local/bin/python3"
