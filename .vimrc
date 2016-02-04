set encoding=utf-8
set fileencodings=utf-8,big5

syntax on
set t_Co=256
set incsearch
set hls
set nu
set ru
set ic
set encoding=utf-8
set fileencoding=utf-8
" set mouse=a
set modeline
set cursorline
"set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=100
set expandtab
set sw=4
set tabstop=4
set nocompatible              " be iMproved, required
set nobomb
set showmatch

set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo

Plugin 'ap/vim-css-color'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'c9s/colorselector.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-ragtag'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/OOP-javascript-indentation'
Plugin 'vim-scripts/taglist.vim'

Plugin 'webberwu/php-doc.vim'
Plugin 'webberwu/vim-fugitive'

Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'joshliao11/html'
"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'joshliao11/vim-snippets'
"end snipmate

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme desert
colorscheme molokai

autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=php
autocmd BufNewFile,BufRead *.htm set filetype=php

highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set foldmethod=indent
set foldlevelstart=99
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
"autocmd Syntax php normal zR


"let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']
"let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = ','

"---ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"php-doc
inoremap <C-K> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-K> :call PhpDocSingle()<CR>
vnoremap <C-K> :call PhpDocRange()<CR>

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


"---vim-autocomplpop
let g:acp_behaviorUserDefinedMeets = 'acp#meetsForKeyword'
let g:acp_behaviorUserDefinedFunction = 'syntaxcomplete#Complete'

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

"---syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_css_checkers=[]
let g:syntastic_javascript_checkers=['jshint']

"back to last edit position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" set airline

set laststatus=2

" " enable tabline
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
" " set left separator
let g:airline#extensions#tabline#left_sep = ' '
" " set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='murmur'

"vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=234

"Shougo/neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"taglist
nnoremap <silent> <F8> :TlistToggle<CR>

set completeopt-=preview
nnoremap <silent> <F9> :set paste<CR>
nnoremap <silent> <F5> :NERDTree<CR>

inoremap jj <ESC>
inoremap jk ->
inoremap jst console.log('in'); e.preventDefault();
inoremap vpa <?= $view->partial('test.phtml', $view) ?>

nnoremap <silent> <F7> :call EventInit()<CR>
function EventInit()
    execute '1s/.*/<?php/'
    call append(1, "require_once(__DIR__ . '/init.php');")
    call append(2, "?><!DOCTYPE html>")
    let sline = search("<link")
    call append(sline - 1, "<?= $view->partial('fbmeta.phtml', $view) ?>")
    let titletag = search('<title>')
    execute titletag . 's/\>.*\</><?= $eventTitle ?><\/'

    let sline = search("main.js")
    call append(sline, "<?= $view->partial('head.phtml', $view) ?>")
    let sline = search("<body")
    call append(sline, "<?= $view->partial('fbroot.phtml', $view) ?>")
    call append(sline + 1, "<?= $view->partial('header.phtml', $view) ?>")
    let sline = search("</body>")
    call append(sline - 1, "<?= $view->partial('ga.phtml', $view) ?>")
endfunction
