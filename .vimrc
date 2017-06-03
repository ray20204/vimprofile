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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'c9s/colorselector.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/OOP-javascript-indentation'

" 快速註解
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'ervandew/supertab'

Plugin 'drmingdrmer/xptemplate'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-ragtag'
Plugin 'Townk/vim-autoclose'
Plugin 'junegunn/vim-easy-align'

Plugin 'mikehaertl/pdv-standalone'

Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'joshliao11/html'
"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'ray20204/vim-snippets'
Plugin 'Valloric/MatchTagAlways'
"end snipmate
Plugin 'majutsushi/tagbar'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme desert
colorscheme molokai

autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=php
autocmd BufNewFile,BufRead *.htm set filetype=php

highlight ExtraWhitespace ctermbg=1 guibg=red
" Set cursorline colors
highlight CursorLine ctermbg=235
" Set color of number column on cursorline
highlight CursorLineNR ctermbg=235 ctermfg=blue

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
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_alt_sep = '｜'
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'murmur'

"vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=234

"Shougo/neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_DisableAutoComplete = 1
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:neocomplcache_force_overwrite_completefunc = 1

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"taglist
nmap <F1> :TagbarToggle<CR>

" matchAtag alswas
let g:mta_use_matchparen_group = 1
let g:mta_set_default_matchtag_color = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'phtml' : 1,
    \ 'xml' : 1,
    \ 'php' : 1,
    \ 'jinja' : 1,
    \}

highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen

set completeopt-=preview
nnoremap <silent> <F9> :set paste<CR>
nnoremap <silent> <F5> :NERDTree<CR>

"vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"end vim-easy-align

" clear whitespace
nnoremap <S-W> :%s/\s\+$//
nnoremap <S-A> ggVG

map <S-H> gT

" go to next tab

map <S-L> gt
" Tab to indent
nmap <tab> V>
nmap <leader><tab> V<

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

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
