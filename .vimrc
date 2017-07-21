

" General behavior {{{ "

set nocompatible              " be iMproved, required
filetype off                  " required

" Sets how many lines of history VIM has to remember
set history=500

" Allow opening up to 100 files in tabs
set tabpagemax=100

set textwidth=80 " 80 char wrapping of text
set colorcolumn=+1 " draw a red column indicating where 80 chars end

" Set to auto read when a file is changed from the outside
set autoread

set clipboard=unnamedplus

set modeline
set hidden

" }}} General behavior "


" Syntastic options {{{ "

let g:EclimCompletionMethod = "omnifunc"

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_exec="/home/mr492/dotfiles/flake8.sh"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}} Syntastic options "

"
" You-Complete-Me options {{{ "

" Used to unblacklist 'mail' filetype = allows for vim-snippets 
" auto-completion in mails.
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1
      \}

let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0

" }}} You-Complete-Me options "


" Command-Line completion {{{ "

" Enhance command-line completion
set wildmenu
" Stuff to ignore for autocompletion
set wildignore=*.png,*.jpg,*.gif " image formats
set wildignore+=*.o,*.obj,*.pyc,*~,*.annot,*.cmo,*.cmt,*.cmti,*.cmi,*.mly 
" compiled files
set wildignore+=*.aux,*.log " latex junk


" Windows-specifics {{{ "

if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" }}} Windows-specifics "

" }}} Command-Line completion "


" Leader mappings {{{ "

" With a map leader it's possible to do extra key combinations
let mapleader = "."
let g:mapleader = "."


" Tabs {{{ "

" Useful noremappings for managing tabs
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove 
noremap <leader>t<leader> :tabnext

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" }}} Tabs "


" Fast closing
noremap <leader>q :wq!<ENTER>

" Fast saving
noremap <leader>w :w<ENTER>

" Make {{{ "

" Fast testing
noremap <leader>t :make test<ENTER>
" fast 'making': in python => runs the program (without arguments)
" in other languages calls 'make'
noremap <leader>r :w<ENTER>:make!<ENTER>

" }}} Make "


" }}} Leader mappings "


" Tabs/Intendation width {{{ "

set expandtab
set shiftwidth=4
set softtabstop=4

" }}} Tabs/Intendation width "


" Search/Replace in Vim: Customizations {{{ "

" case insensitive search
set ignorecase
set smartcase
set gdefault " by default add /g to search/replace

" }}} Search in Vim: Customizations "


" Filetype autodetections (tex, custom filetypes) {{{ "

" Autodetect filetype for .tex files to allow snippets and autocomplete
autocmd BufRead,BufNewFile *.tex :set filetype=tex
autocmd BufRead,BufNewFile *.tex :SyntasticToggleMode
autocmd BufRead,BufNewFile *.anki_vim :set filetype=anki_vim

" }}} Filetype autodetections (tex, anki_vim) "


" Custom make(1) behavior (vim makeprg) {{{ "

autocmd BufRead,BufNewFile :set makeprg=make -j
autocmd BufRead,BufNewFile *.py :set makeprg=python3\ %
autocmd BufRead,BufNewFile *.java :set makeprg=javac\ %

" }}} Customized behavior of vim's 'make'prg "


" Line numbering {{{ "

" Allow numbering
set number
set relativenumber

" Toggle between relative and absolute line numbers freely
autocmd InsertEnter * :set relativenumber!
autocmd InsertLeave * :set relativenumber!

" }}} Line numbering "


" TODO: replace these with something more useful in the longer run
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" Vundle Plugins {{{ "


execute pathogen#infect()


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Rainbow Parantheses with enabled options
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]


" Solarized color scheme
syntax enable
set background=dark
colorscheme solarized
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/syntastic'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'mbbill/undotree'

Plugin 'Valloric/YouCompleteMe'

Plugin 'taketwo/vim-ros'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

Plugin 'Raimondi/delimitMate'
"Auto sets Parentheses

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"Coloured Parentheses"

Plugin 'hynek/vim-python-pep8-indent'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Track the engine.
 Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
 Plugin 'honza/vim-snippets'
Plugin 'nvie/vim-flake8'

" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-v>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" }}} Vundle Plugins "


" Source vimrc {{{ "

" Util function to source .vimrc
if !exists("*SourceConfigs")
  function! SourceConfigs()
    let files = ".vimrc"
    source $MYVIMRC
    echom "Sourced " . files
  endfunction
endif


" F12: Source .vimrc
nnoremap <F12> :call SourceConfigs()<CR>

" }}} Source vimrc "


" Backups, undos, swaps {{{ "

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif

" Backups {{{ "
" Centralize backups, swapfiles and undo history
if !isdirectory($HOME."/.vim/backups")
    call mkdir($HOME."/.vim/backups", "", 0700)
endif
set backupdir=~/.vim/backups

" }}} Backups "


" Undos {{{ "
nnoremap <F5> :UndotreeToggle<cr>
" Store undos in a file to be able to undo with 
" 'infinite' horizon even after a file was closed
" Let's save undo info!
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undofile
set undodir=~/.vim/undo-dir//

" }}} Undos "


" Swaps {{{ "

" Store swaps centrally in one folder to make them more manageable.
if !isdirectory($HOME."/.vim/swaps")
    call mkdir($HOME."/.vim/swaps", "", 0700)
endif
set directory=~/.vim/swaps

" }}} Swaps "


" }}} Swaps, backups, undos "


" Automatic Shebang writing {{{ "

augroup Shebang

" Helper functions {{{ "

function! WriteShebang(...)
    " Generate a shebang line (can be multiline, this function takes variable
    " amounts of arguments) for script files.
    call setline(".", a:1)
    for i in range(2, a:0)
        let failed = append("$", a:{i})
        if (failed)
            echom("Failed to add shebang line..")
        else
            " Notify vim about modifications from this script
            let &modified = 1
        endif
    endfor
    let failed = append("$", "")
    if failed
        echom("Failed to add shebang line..")
    else
        let &modified = 1
    endif
    :normal! G
endfunction

function! WriteHeaderIfndef()
    " Automatically writes the ifndef definition on top of c++ header files
    " and smartly includes the filename in the tag => No more excuses for
    " missing ifndefs
    
    " Get name of current file (without extension)
    let name=toupper(expand("%:t:r"))
    call setline(".", "#ifndef " . name . "_H")
    call append("$", "#define " . name . "_H")
    call append("$", "")
    call append("$", "#endif")
    " jump to free line
    :normal 3G
endfunction

" }}} Helper functions "

    " For python: write shebang line and make executable
    autocmd BufNewFile *.py :call WriteShebang("\#!/usr/bin/env/python3", "\# -*- coding: iso-8859-15 -*-")
    autocmd BufNewFile *.sh :call WriteShebang("\#!/bin/sh")
    autocmd BufNewFile *.h :call WriteHeaderIfndef()


    autocmd BufWritePost *.py,*.sh silent !chmod +x %
    " TODO: ADD SHEBANGS FOR RUBY, other scripting languages
augroup END

" }}} Automatic Shebang writing "


" Folding {{{ "
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
augroup Folding
    autocmd BufRead,BufNewFile ~/.zsh/*.zsh :setlocal foldmethod=marker
    autocmd BufRead,BufNewFile ~/.vimrc :setlocal foldmethod=marker
    autocmd BufRead,BufNewFile *.tex :setlocal foldmethod=marker
    autocmd BufRead,BufNewFile ~/.i3/config :setlocal foldmethod=marker
    autocmd BufRead,BufNewFile ~/.i3/i3status.conf :setlocal foldmethod=marker
    autocmd BufRead,BufNewFile ~/.muttrc :setlocal foldmethod=marker
augroup END

" }}} Folding "


" Statusline Customization ----------------------------------------------- {{{
" large parts shamelessly 'borrowed' of 'scrooloose/vimfiles' 
set noruler
set laststatus=2
"statusline setup
set statusline =%#identifier#
set statusline+=[%f]    "tail of the filename [.vimrc] or [Anki/anki_vim.py]
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%y      "filetype (e.g. [python])

set statusline+=%=      "left/right separator
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" }}}

" Delete trailing whitespace (python) {{{ "

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()

" }}} Delete trailing whitespace (python) "
