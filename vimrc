" Credits --------------------------------------------------------------------
" /via https://github.com/gf3/dotfiles/blob/master/.vimrc
" /via http://www.jukie.net/~bart/conf/vimrc
" /via https://github.com/challendy/vim_bash_setup/blob/master/vim_setup/keybindings.gui.vim
" /via https://github.com/holman/dotfiles/blob/master/vim/gvimrc.symlink
" /via http://stackoverflow.com/questions/164847/what-is-in-your-vimrc/171558#171558
" /via https://github.com/yodiaditya/vim-pydjango/blob/master/.vimrc

" Help -----------------------------------------------------------------------
" http://vim.wikia.com/wiki/Best_Vim_Tips
" http://vim.wikia.com/wiki/Remove_unwanted_spaces

:autocmd!

" Pathogen (plugin loader) ---------------------------------------------------
call pathogen#infect()

" VIM settings ---------------------------------------------------------------
set nocompatible                " turn vi compatibility off
set encoding=utf-8              " UTF-8 encoding
set t_Co=256                    " 256 colors
set history=1000                " command line history
set undolevels=1000             " undo history
set tabstop=4                   " tab display width
set softtabstop=4               " tab width
set shiftwidth=4                " <TAB> indents this width
set expandtab                   " tabs -> spaces
set smarttab                    " make <TAB> and <BS> smarter
set autoindent                  " turn on auto indenting (match prev line)
set smartindent                 " turn on smart indenting
set textwidth=78                " wrap text on this column
set showmatch                   " show matching brackets
set number                      " show line numbers
set title                       " show filename in console title bar
set ruler                       " show status line
set showcmd                     " display incomplete commands
set showmode                    " show current mode
set hlsearch                    " highlight search results
set incsearch                   " search-as-you-type
set ignorecase                  " case-insensitive…
set smartcase                   " …unless phrase includes uppercase
set gdefault                    " add g flag to search/replace by default
set novisualbell                " turn visual error bells off
set noerrorbells                " turn error bells off
set vb t_vb=                    " turn beeps off
set nowrap                      " turn wrapping off
set linebreak                   " wrap only on word boundaries
set autochdir                   " set working directory to the current file
set scrolloff=5                 " keep at least 5 lines above/below cursor
set sidescrolloff=5             " keep at least 5 columns left/right of cursor
set splitbelow                  " split new windows below current window
set splitright                  " split new windows on the right side of current window
set laststatus=2                " always show the statusline, even if there is only one window
set undofile                    " undo history between sessions
set undodir=~/.vim/backup       " directory for undo files
set backupdir=~/.vim/backup     " directory for swp files
set directory=~/.vim/backup     " directory for swp files
set clipboard=unnamed           " Clipboard support
set backspace=eol,start,indent  " allow backspacing over EOL, ...
set wildmenu                    " : menu has tab completion
set wildmode=list:longest       " behave like in shell: show options
set wildignore+=.DS_Store,*.o,*.obj,*.pyc,*.png,*.jpg,.git,.aux
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:❯,precedes:❮
"set foldmethod=marker
"set foldopen=all,insert
"set foldclose=all
"set cursorline                 " highlight current line
"set list!                      " show invisible characters
syntax on                       " syntax highlighting

" Statusline -----------------------------------------------------------------
" %< : truncation point
" \  : space
" %f : relative path to file
" %F : absolute path to file
" %m : modified flag [+] (modified), [-] (unmodifiable) or nothing
" %r : readonly flag [RO]
" %y : filetype [ruby]
" %= : split point for left and right justification
" %-14.( %) :  block of fixed width 14 characters
" %l : current line
" %c : current column
" %V : current virtual column as -{num} if different from %c
" %P : percentage through buffer
" %p : percentage through buffer
set statusline=%#warningmsg#%*%<\ %F\ %m%r%y\ %=%-14.(%l,%c%V%)\ %P\ %v


" Mouse ----------------------------------------------------------------------
if has('mouse')
    set mouse=a                 " enable mouse in all modes
endif

" Key Mappings ---------------------------------------------------------------
" easier command typing
nnoremap ; :
vnoremap ; :

" Swap ; and :
"nnoremap ; :
"nnoremap : ;

" exit to normal mode the easy way
inoremap jk <ESC>

" jump to start/end of line (instead of top/bottom of screen)
nnoremap H ^
nnoremap L g_

" jump back and forth in cursor position history
"map H <C-o>
"map L <C-i>

" auto completion: CTRL-SPACE
"inoremap <TAB> <C-x><C-o>
inoremap <C-space> <C-x><C-o>

" don't move on * (and center view)
nnoremap * *<C-o>
"nnoremap * *<C-o>zz

" reformat paragraph
nnoremap Q gqap
"nnoremap Q gqip
vnoremap Q gq

" yank from cursor to $
map Y y$

" delete from cursor to $
map D d$

" search next/previous & center view
nmap n nzz
nmap N Nzz

" (de)indent
nmap > >>
nmap < <<
nmap <tab> >>
nmap <S-tab> <<

" insert a newline below/above
nnoremap <silent> zj o<ESC>
nnoremap <silent> zk O<ESC>

" quickly add a comma/semi colon, colon at the end of the string
"inoremap ,, <END>,
inoremap ;; <END>;
inoremap :: <END>:

" Remap :W to :w
command! W w

" new tab: CTRL-TAB
nnoremap <silent> <C-t> :tabnew<CR>

" split resizing: {+,-}
nmap + <C-W>>
nmap - <C-W><
nmap <leader>+ 50<C-W>>
nmap <leader>- 50<C-W><

" switch split windows: CTRL-{h,l}
noremap  <C-h> <C-w>h
noremap  <C-l> <C-w>l

" switch tabs with CTRL-{j,k}
noremap  <C-j> :tabnext<CR>
noremap  <C-k> :tabprevious<CR>
inoremap <C-j> <C-o>:tabext<CR>
inoremap <C-k> <C-o>:tabprevious<CR>

" edit file in new tab
nmap te :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" edit command with the path of the currently edited file filled in
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" move lines up or down
nnoremap ;j mz:m+<CR>`z==
nnoremap ;k mz:m-2<CR>`z==
inoremap ;j <ESC>:m+<CR>==gi
inoremap ;k <ESC>:m-2<CR>==gi
vnoremap ;j :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap ;k :m'<-2<CR>gv=`>my`<mzgv`yo`z

" easy filetype switching
nnoremap _md :set ft=markdown<CR>

" Split/Join
" /via https://bitbucket.org/sjl/dotfiles/src/b5e60ade957d/vim/.vimrc
"
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
"            becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" Especially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^


" Mac OS X specific key mappings ---------------------------------------------

" Tab navigation
if has("mac")
    " switch tabs with CMD-{j,k}
    nmap <D-j> :tabnext<CR>
    nmap <D-k> :tabprevious<CR>
    vmap <D-]> :tabnext<CR>
    vmap <D-[> :tabprevious<CR>
    imap <D-]> <C-O>:tabnext<CR>
    imap <D-[> <C-O>:tabprevious<CR>

    " CMD-# switches to tab #
    nmap <D-1> 1gt
    nmap <D-2> 2gt
    nmap <D-3> 3gt
    nmap <D-4> 4gt
    nmap <D-5> 5gt
    nmap <D-6> 6gt
    nmap <D-7> 7gt
    nmap <D-8> 8gt
    nmap <D-9> 9gt

    " TextMate like indent: CMD-] , CMD-[
    nmap <D-]> >>
    nmap <D-[> <<
    vmap <D-]> >>
    vmap <D-[> <<
    imap <D-]> <C-O>>>
    imap <D-[> <C-O><<
endif


" Leader Key Mappings --------------------------------------------------------
" start macros with ,
let mapleader=','

" open directory of current file in current tab
noremap <leader>d :e %:h/<CR>

" open directory of current file in new tab
noremap <leader>dt :tabnew %:h/<CR>

" clear last search
noremap <silent> <leader><leader> <ESC>:noh<CR>
nnoremap <silent> <leader>/ :noh<CR>
nnoremap <silent> <ESC> :noh<CR>

" re-source .[g]vimrc
if has('gui_running')
    map <leader>vs :source ~/.gvimrc<CR>
else
    map <leader>vs :source ~/.vimrc<CR>
endif

" word swapping
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>

" char swapping
nmap <silent> gc xph

" substitute
nnoremap <leader>s :%s//<left>

" find merge conflict markers
map <leader>fc /\v^[<=>]{7}( .*\|$)<CR>

" search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<left>

" Create a split on the given side.
" /via https://github.com/henrik/dotfiles/blob/master/vimrc
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nnoremap swj :leftabove  vsp<CR>
nnoremap swk :rightbelow vsp<CR>


" OS-wide clipboard support (if vim is compiled w/ +clipboard option)
nnoremap <silent> <leader>y "+y
nnoremap <silent> <leader>Y "+yy
nnoremap <silent> <leader>p "+p
nnoremap <silent> <leader>P "+P
nnoremap <leader>v "+P

" In insert mode, you can paste from clipboard using CTRL+v
inoremap <C-v> <ESC>:set paste<CR>"+gp<ESC>:set nopaste<CR>i<RIGHT>

" page down with <SPACE>, pageup with - or <BkSpc>
noremap <Space> <PageDown>
noremap <BS> <PageUp>


" Toggles --------------------------------------------------------------------
" toggle paste mode
nmap <leader>pp :set paste!<CR>

" toggle line wrapping on/off
nmap <silent> <leader>\ :set wrap!<CR>

" toggle invisibles
nmap <silent> <leader>inv :set list!<CR>

" Space will toggle folds
"nnoremap <space> za


" Enable filetype plugin & indention files detection -------------------------
filetype plugin indent on


" Auto Commands --------------------------------------------------------------

" auto reload .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC
autocmd BufWritePost vimrc source $MYVIMRC

" show wrap column
if exists('+colorcolumn')
    set colorcolumn=78
    highlight ColorColumn ctermbg=gray
else
    " highlight chars over the wrap column
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>78v.\%<81v', -1)
endif

" remove trailing whitespace on save
autocmd BufRead,BufWritePre * if ! &bin | silent! %s/\s\+$//ge | endif

" remember cursor position after reload
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Auto completion ------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete

autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP


"autocmd FileType python set complete+=k~/.vim/dict/python " isk+=.,(

" Hide # comment markers from folded text in Python scripts.
"autocmd FileType python set commentstring=#%s

" Enable completion of hexadecimal color codes in CSS style sheets.
autocmd FileType css setlocal iskeyword+=#

" Disable text wrapping and folds in quick-fix lists, HTML files and tags files.
autocmd FileType help,qf,tags,html,strace setlocal nowrap nofoldenable nospell


" Python ---------------------------------------------------------------------

" execute Python file
nnoremap <S-e> :!python %<CR>

augroup lang_python
    autocmd FileType python setlocal
    \   shiftwidth=4 tabstop=4 softtabstop=4 expandtab
    \   nowrap
    \   formatoptions+=croq " c+r+o+q
    \   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    \   complete+=k~/.vim/syntax/python.vim isk+=.,(
    let python_highlight_all = 1

    " PyRef shortcut
    let g:pyref_mapping = 'K'
augroup END


" Execute python tests -------------------------------------------------------
" /via https://github.com/nureineide/dotvim/blob/master/vimrc
"map <silent>tf <Esc>:Pytest file<CR>
"map <silent>tc <Esc>:Pytest class<CR>
"map <silent>tm <Esc>:Pytest method<CR>
" cycle through test errors
"nmap <silent>tn <Esc>:Pytest next<CR>
"nmap <silent>tp <Esc>:Pytest previous<CR>
"nmap <silent>te <Esc>:Pytest error<CR>
"nmap <silent>tee <Esc>:Pytest end<CR>


" import local .vimrc file ---------------------------------------------------
if filereadable($HOME."/.local/vimrc")
    source ~/.local/vimrc
endif


" TODO: test this on Linux ---------------------------------------------------
" don't redraw during macros
set lazyredraw
