set nocompatible                " turn vi compatibility off

" turn existing autocommands off (-> necessary for .vimrc auto-reloads)
:autocmd!

" VIM settings ---------------------------------------------------------------
set encoding=utf-8              " UTF-8 encoding
set t_Co=256                    " 256 colors
set history=1000                " command line history
set undolevels=1000             " undo history
set tabstop=4                   " tab display width
set softtabstop=4               " tab width
set shiftwidth=4                " <TAB> indents this width
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab                   " tabs -> spaces
set smarttab                    " make <TAB> and <BS> smarter
set autoindent                  " turn on auto indenting (match previous line)
set smartindent                 " turn on smart indenting
"set textwidth=78               " wrap text on this column
set showmatch                   " show matching brackets
set number                      " show line numbers
set title                       " show filename in console title bar
set ruler                       " show status line
set showcmd                     " display incomplete commands
set showmode                    " show current mode
set hlsearch                    " highlight search results
set incsearch                   " search-as-you-type
set ignorecase                  " ignore case in searches...
set smartcase                   " ...unless phrase includes uppercase
set gdefault                    " search/replace by default globally on lines
set novisualbell                " turn visual error bells off
set noerrorbells                " turn error bells off
" turn beeps off
set vb t_vb=
set nowrap                      " turn wrapping off
set linebreak                   " wrap only on word boundaries
set autochdir                   " set working directory to the current file
set scrolloff=5                 " keep at least 5 lines above/below cursor
set sidescrolloff=5             " keep at least 5 columns left/right of cursor
set splitbelow                  " split new windows below current window
set splitright                  " split new windows on the right side of current window
"set cmdheight=2
set laststatus=2                " always show the statusline, even if there is only one window
set backupdir=/tmp//            " directory for swp files
set directory=/tmp//            " directory for swp files
set clipboard=unnamed           " Clipboard support
set backspace=eol,start,indent  " allow backspacing over EOL, ...
set wildmenu                    " : menu has tab completion
set wildmode=list:longest       " behave like in shell: show options
set wildignore+=.DS_Store,*.o,*.obj,*.pyc,*.png,*.jpg,*.aux,.git
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:❯,precedes:❮
" for html
set matchpairs+=<:>

"set foldenable                  " enable folding
"set foldcolumn=2                " add a fold column
"set foldmethod=marker           " detect triple-{ style fold markers
"set foldlevelstart=0            " start out with everything folded
"set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
"set foldmethod=marker
"set foldopen=all,insert
"set foldclose=all

"set cursorline                  " highlight current line
"set list!                       " show invisible characters

"set tildeop                     " ~ acts as a operator (e.g. ~w)
syntax on                       " syntax highlighting

if exists('&undofile')                                              " VIM 7.3
    set undofile                    " undo history between sessions
    set undodir=~/.vim/tmp/undo/    " directory for undo files
    set undoreload=10000            " maximum number lines to save for undo on a buffer reload
endif

if version >= 703                                                   " VIM 7.3
    set relativenumber              " show by default relative line numbers (for vim startup)

    " absolute line numbers in insert mode, relative otherwise for easy movement
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
endif


" Statusline -----------------------------------------------------------------
set statusline=%#warningmsg#%*%<
set statusline+=\ %F\ %m%r%y\ %h%w
set statusline+=%=
set statusline+=\ \|\ %{strlen(&fenc)?&fenc:&enc}
set statusline+=\ \|\ %3l/%L\ :\ %2c\ \|\ %P


" Mouse ----------------------------------------------------------------------
if has('mouse')
    set mouse=a                 " enable mouse in all modes
endif

" Key Mappings ---------------------------------------------------------------
" move by screen line instead of actual line
nnoremap j gj
nnoremap k gk

" exit to normal mode the easy way
inoremap ;; <ESC>
inoremap jj <ESC>
inoremap jk <ESC>

" jump to start/end of line (instead of top/bottom of screen)
noremap H ^
noremap L g_

" Redo with U & undo with u
nnoremap U <C-R>

" yank from cursor to $ (default: Y yanks whole line)
map Y y$

" delete from cursor to $ (default: D does the same?)
"map D d$

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" don't move on * (search for word under cursor)
nnoremap * *<C-o>

" search next/previous & center view
nmap n nzz
nmap N Nzz

" clear search highlights
noremap <silent> <ESC><ESC> :nohls<CR>

" reformat paragraph
nnoremap Q gqap
vnoremap Q gq

" Keep the cursor in place while joining lines
" TODO
"nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<CR><ESC>^mzgk:silent! s/\v +$//<CR>:nohls<CR>`w

" (de)indent
nmap > >>
nmap < <<
vnoremap > >gv
vnoremap < <gv

" move split window into new tab
nnoremap T <C-w>T

" split resizing: {+,-}
nmap + 20<C-W>>
nmap - 20<C-W><
nmap _ 20<C-W><

" switch tabs with CTRL-{j,k}
noremap  <C-j> <C-PageUp>
noremap  <C-k> <C-PageDown>
inoremap <C-j> <C-PageUp>
inoremap <C-k> <C-PageDown>

" swap words
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>

" insert a new line below/above
"nnoremap <silent> <C-h> mzo<ESC>`z
"nnoremap <silent> <C-l> mzO<ESC>`z
"vnoremap <silent> <C-h> <ESC>mzo<ESC>`zgv
"vnoremap <silent> <C-l> <ESC>mzO<ESC>`zgv

" move lines up/down (doen't shadow ⌃N, ⌃P in {insert} mode (autocompletion)
"nnoremap <C-n> mz:m+<CR>`z==
"nnoremap <C-p> mz:m-2<CR>`z==
"vnoremap <C-n> :m'>+<CR>gv=`<my`>mzgv`yo`z
"vnoremap <C-p> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" omni autocompletion: ⌃F
inoremap <C-f> <C-x><C-o>

" folding
nnoremap <Space> za
vnoremap <Space> za

" %% puts the current path in command mode
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" easy filetype switching
nnoremap _d  :set ft=diff<CR>
nnoremap _md :set ft=markdown<CR>

" go with smartindent if there is no plugin indent file.
" but don't outdent hashes
inoremap # X<BS>#

" Leader Key Mappings --------------------------------------------------------
" start macros with ; (you might like \ or ,)
let mapleader=';'

nnoremap <leader><leader> :

" save file
map <leader>w :w<CR>

" save and close file
map <leader>W :wq<CR>
map <leader>x :x<CR>

" close file
map <leader>q :q<CR>

" close all files
map <leader>Q :qa<CR>

" open files
map <leader>e :e %%
map <leader>t :tabedit %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" create splits
nnoremap <leader>H :topleft vsp<CR>
nnoremap <leader>J :botright sp<CR>
nnoremap <leader>K :topleft sp<CR>
nnoremap <leader>L :botright vsp<CR>

" switch split windows: CTRL-{h,l}
nnoremap <C-h> <C-w>h
"nnoremap <leader>j <C-w>j
"nnoremap <leader>k <C-w>k
nnoremap <C-l> <C-w>l

" open directory of current file in current tab
" TODO
noremap <leader>d :e %:h/<CR>

" open directory of current file in new tab
" TODO
noremap <leader>dt :tabedit %:h/<CR>

" resize all splits equally
nmap <leader>= <C-W>=

" re-source .[g]vimrc
if has('gui_running')
    map <leader>vs :source ~/.gvimrc<CR>
else
    map <leader>vs :source ~/.vimrc<CR>
endif

" substitute (search & replace)
nnoremap <leader>s :%s//<left>

" search & replace word under cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<left>

" find VCS merge conflict markers
map <leader>c /\v^[<=>]{7}( .*\|$)<CR>

" select the just pasted text
nnoremap <leader>v V`]

" paste from clipboard using ⌃v in insert mode
inoremap <C-v> <ESC>:set paste<CR>"+gp<ESC>:set nopaste<CR>i<RIGHT>

" OS-wide clipboard support (works if vim is compiled w/ +clipboard option)
" TODO
nnoremap <silent> <leader>y "+y
nnoremap <silent> <leader>Y "+yy
nnoremap <silent> <leader>p "+p
nnoremap <silent> <leader>P "+P

" fold a HTML tag
nnoremap <leader>ft Vatzf

" sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:nohls<CR>


" Toggles --------------------------------------------------------------------
" toggle paste mode
nnoremap <leader>pp :set paste!<CR>

" toggle line wrapping
nnoremap <leader>\ :set wrap!<CR>

" toggle invisibles
nnoremap <leader>inv :set list!<CR>

" toggle line numbers
nnoremap <leader>num :setlocal number!<CR>

" toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>


" Command Mode ---------------------------------------------------------------
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>


" Mac OS X specific key mappings ---------------------------------------------
" Tab navigation
if has("mac")
    " switch tabs with CMD-{j,k}, CMD-{ and CMD-}
    nmap <D-j> <C-PageUp>
    nmap <D-k> <C-PageDown>
    imap <D-j> <C-PageUp>
    imap <D-k> <C-PageDown>
    vmap <D-{> <C-PageUp>
    vmap <D-}> <C-PageDown>
    imap <D-{> <C-PageUp>
    imap <D-}> <C-PageDown>

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
endif


" Enable filetype plugin & indention files detection -------------------------
filetype plugin indent on


" Auto Commands --------------------------------------------------------------

" auto reload .vimrc
autocmd BufWritePost .vimrc,vimrc source $MYVIMRC

" TODO
"highlight SpellBad term=underline gui=undercurl guisp=Orange


" show wrap column
if hlexists('ColorColumn')
else
    highlight ColorColumn ctermbg=grey guibg=grey
endif

if exists('+colorcolumn')                                           " VIM 7.3
    set colorcolumn=78
else
    " highlight chars over the wrap column
    autocmd BufWinEnter * let w:m2=matchadd('ColorColumn', '\%>78v.\%<81v', -1)
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

" enable completion of hexadecimal color codes in CSS style sheets.
autocmd FileType css        setlocal iskeyword+=#

" format options for documents
autocmd BufRead *.txt       set textwidth=78 formatoptions=tcroqn2l
autocmd BufRead *.tex       set textwidth=78 formatoptions=tcroqn2l
autocmd BufRead *.md        set textwidth=78 formatoptions=tcroqn2l


" Plugins --------------------------------------------------------------------

" NERDTree --------------------------------------------------------------- {{{
" show NERDTree file browser
nnoremap <silent> <C-w> :NERDTreeToggle<CR>

" auto close NERDTree split window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Gundo ------------------------------------------------------------------ {{{
" show Gundo outline viewer
nnoremap <silent> <C-g> :GundoToggle<CR>
" }}}

" TODO
"nnoremap <leader>a :Ack!<space>


" Functions ------------------------------------------------------------------
" remove an empty pair of parentheses, braces or quotes
function! BackSpaceEmptyPair()
    let between = strpart(getline('.'), col('.')-2, 2)
    let rightof = strpart(getline('.'), col('.')-3, 2)
    for pair in (split(&matchpairs, ',') + ["':'", '":"', '`:`'])
        let emptypair = join(split(pair, ':'), '')
        if between == emptypair
            return "\<right>\<BS>\<BS>"
        elseif rightof == emptypair
            return "\<BS>\<BS>"
        endif
    endfor
    return "\<BS>"
endfunc

inoremap <expr> <BS> BackSpaceEmptyPair()

" swap split windows {{{
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
" }}}

" import local .vimrc file ---------------------------------------------------
"if filereadable($HOME.'/.local.dotfiles/vimrc')
if filereadable(expand('~/.local.dotfiles/vimrc'))
    source ~/.local.dotfiles/vimrc
endif


" Statusline -----------------------------------------------------------------
" %< : truncation point
" \  : space
" %n : buffer number
" %f : relative path to file
" %F : absolute path to file
" %m : modified flag [+] (modified), [-] (unmodifiable) or nothing
" %r : readonly flag [RO]
" %y : filetype [ruby]
" %= : split point for left and right justification
" %-14.( %) :  block of fixed width 14 characters
" %l : current line
" %L : number of lines in buffer
" %c : current column
" %V : current virtual column as -{num} if different from %c
" %P : percentage through buffer
" %p : percentage through buffer
" %{&ff} : linebreaks

" Text Formatting Options ----------------------------------------------------
" t - wrap text using textwidth
" c - wrap comments using textwidth (and auto insert comment leader)
" r - auto insert comment leader when pressing <return> in insert mode
" o - auto insert comment leader when pressing 'o' or 'O'.
" q - allow formatting of comments with "gq"
" a - auto formatting for paragraphs
" n - auto wrap numbered lists


" Possible key mapping shortcuts ---------------------------------------------
" TODO
"noremap <leader><space>
"noremap <leader>/

" TODO
" ;e — ;e, ;es, ;ev (edit, edit in split, edit in vsplit)
" ;d — ;d, ;dt (open dir in window, open dir in tab)
