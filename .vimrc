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
"set mouse=a
set modeline
set cursorline
"set background=dark
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=100
set undolevels=100
set expandtab
set sw=4
set tabstop=4
set nocompatible              " be iMproved, required
set nobomb
set showmatch
set autoindent
set ttyfast
set lazyredraw

set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash

filetype off                  " required

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" plugin on GitHub repo

Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cakebaker/scss-syntax.vim'

" 快速註解
Plug 'mikehaertl/pdv-standalone'
Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'
" syntax check
Plug 'scrooloose/syntastic'

Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neocomplcache.vim'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'

Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'

"snipmate
Plug 'drmingdrmer/xptemplate'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'garbas/vim-snipmate'
"Plug 'ray20204/vim-snippets'
Plug 'Valloric/MatchTagAlways'
"end snipmate
Plug 'majutsushi/tagbar'

Plug 'elzr/vim-json'

"git
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

"colorscheme molokai
set background=dark
colorscheme material

autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.html set filetype=php
autocmd BufNewFile,BufRead *.htm set filetype=php
autocmd BufNewFile,BufRead *.json set filetype=json

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


"let NERDTreeIgnore=['\~$', '\.lo$', '\.la$']
"let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = ','

"---ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

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
let g:syntastic_php_checkers=['php']
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
"let g:airline_theme = 'murmur'
let g:airline_theme = 'onedark'

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

augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END
let g:indentLine_noConcealCursor=""

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

" vim-multiple-cursors

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
