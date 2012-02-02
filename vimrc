set nocompatible                " turn vi compatibility off

" turn existing autocommands off (-> necessary for .vimrc auto-reloads)
:autocmd!

" Pathogen (plugin loader) ---------------------------------------------------
call pathogen#infect()

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
set ignorecase                  " case-insensitive…
set smartcase                   " …unless phrase includes uppercase
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
"set splitbelow                  " split new windows below current window
"set splitright                  " split new windows on the right side of current window
"set cmdheight=2
set laststatus=2                " always show the statusline, even if there is only one window
set backupdir=~/.vim/tmp//      " directory for swp files
set directory=~/.vim/tmp//      " directory for swp files
set clipboard=unnamed           " Clipboard support
set backspace=eol,start,indent  " allow backspacing over EOL, ...
set wildmenu                    " : menu has tab completion
set wildmode=list:longest       " behave like in shell: show options
set wildignore+=.DS_Store,*.o,*.obj,*.pyc,*.png,*.jpg,.git,.aux
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:❯,precedes:❮

"set foldenable                  " enable folding
"set foldcolumn=2                " add a fold column
"set foldmethod=marker           " detect triple-{ style fold markers
"set foldlevelstart=0            " start out with everything folded
"set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
"set foldmethod=marker
"set foldopen=all,insert
"set foldclose=all

"set cursorline                 " highlight current line
"set list!                      " show invisible characters

"set tildeop                     " ~ acts as a operator (e.g. ~w)
syntax on                       " syntax highlighting

if exists('&undofile')                                              " VIM 7.3
    set undofile                    " undo history between sessions
    set undodir=~/.vim/tmp/undo/    " directory for undo files
    set undoreload=10000            " maximum number lines to save for undo on a buffer reload
endif

"if v:version >= 730
"else
"endif


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
set statusline=%#warningmsg#%*%<
set statusline+=\ %F\ %m%r%y\ %h%w
set statusline+=%=
set statusline+=%{fugitive#statusline()}
set statusline+=\ \|\ %{strlen(&fenc)?&fenc:&enc}
set statusline+=\ \|\ %3l/%L\ :\ %2c\ \|\ %P


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

nnoremap / /\v
vnoremap / /\v

" exit to normal mode the easy way
inoremap jk <ESC>
inoremap jj <ESC>

" jump to start/end of line (instead of top/bottom of screen)
nnoremap H ^
nnoremap L g_

" jump back and forth in cursor position history
"map H <C-o>
"map L <C-i>

" move by screen line instead of actual line
nnoremap j gj
nnoremap k gk

" auto completion: CTRL-SPACE
inoremap <C-space> <C-x><C-o>
inoremap <C-F> <C-x><C-o>

" go to corresponding bracket
nnoremap <Tab> %
"vnoremap <Tab> %

" don't move on * (and center view)
nnoremap * *<C-o>
"nnoremap * *<C-o>zz

" reformat paragraph
nnoremap Q gqap
vnoremap Q gq
" format the entire file
nmap <leader>Q ggVG=

" yank from cursor to $ (default: Y yanks whole line)
map Y y$

" delete from cursor to $ (default: D does the same?)
"map D d$

" search next/previous & center view
nmap n nzz
nmap N Nzz

" (de)indent
nmap > >>
nmap < <<
vnoremap > >gv
vnoremap < <gv
vmap <tab> >gv
vmap <s-tab> <gv

" insert a newline below/above
nnoremap <silent> zj o<ESC>
nnoremap <silent> zk O<ESC>

" quickly add a comma, semi colon, colon at EOL
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
nmap <leader>= <C-W>=

" switch split windows: CTRL-{h,l}
noremap  <C-h> <C-w>h
noremap  <C-l> <C-w>l

" switch tabs with CTRL-{j,k}
noremap  <C-j> :tabprev<CR>
noremap  <C-k> :tabnext<CR>
inoremap <C-j> <C-o>:tabprev<CR>
inoremap <C-k> <C-o>:tabnext<CR>

cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ew :e %%
map <leader>es :s %%
map <leader>ev :vsp %%
map <leader>et :tabedit %%

nmap te :tabedit %%

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" move lines up or down
nnoremap ;j mz:m+<CR>`z==
nnoremap ;k mz:m-2<CR>`z==
inoremap ;j <ESC>:m+<CR>==gi
inoremap ;k <ESC>:m-2<CR>==gi
vnoremap ;j :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap ;k :m'<-2<CR>gv=`>my`<mzgv`yo`z

" easy filetype switching
nnoremap _md :set ft=markdown<CR>



" make p in Visual mode replace the selected text with the "" register
"vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" select all
"map <c-a> ggVG

" undo in insert mode
"imap <c-z> <c-o>u

" folding
"nnoremap <Space> za
"vnoremap <Space> za


" Mac OS X specific key mappings ---------------------------------------------

" Tab navigation
if has("mac")
    " switch tabs with CMD-{j,k}
    nmap <D-j> :tabprev<CR>
    nmap <D-k> :tabnext<CR>
    imap <D-j> <C-o>:tabprev<CR>
    imap <D-k> <C-o>:tabnext<CR>
    vmap <D-{> :tabprev<CR>
    vmap <D-}> :tabnext<CR>
    imap <D-{> <C-O>:tabprev<CR>
    imap <D-}> <C-O>:tabnext<CR>

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
    "nmap <D-]> >>
    "nmap <D-[> <<
    "vmap <D-]> >>
    "vmap <D-[> <<
    "imap <D-]> <C-O>>>
    "imap <D-[> <C-O><<
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
noremap <silent> <leader><space> <ESC>:noh<CR>
nnoremap <silent> <leader>/ :noh<CR>

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

" shortcut to jump to next conflict marker
nmap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" search and replace word under cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<left>

" create splits
nnoremap <leader>h :topleft vsp<CR>
nnoremap <leader>j :botright sp<CR>
nnoremap <leader>k :topleft sp<CR>
nnoremap <leader>l :botright vsp<CR>


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
noremap <S-Space> <PageUp>
noremap <BS> <PageUp>

" fold a HTML tag (,ft)
nnoremap <leader>ft Vatzf

" sort CSS properties (,S)
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" select the just pasted text (,v)
nnoremap <leader>v V`]


" Toggles --------------------------------------------------------------------
" toggle paste mode
nmap <leader>pp :set paste!<CR>

" toggle line wrapping
nmap <silent> <leader>\ :set wrap!<CR>

" toggle invisibles
nmap <silent> <leader>inv :set list!<CR>


" Enable filetype plugin & indention files detection -------------------------
filetype plugin indent on


" Auto Commands --------------------------------------------------------------

" auto reload .vimrc
autocmd BufWritePost .vimrc,vimrc source $MYVIMRC

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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


" Enable completion of hexadecimal color codes in CSS style sheets.
autocmd FileType css setlocal iskeyword+=#


autocmd BufRead *.txt set textwidth=78 formatoptions=tcroqn2l
autocmd BufRead *.tex set textwidth=78 formatoptions=tcroqn2l
autocmd FileType markdown set textwidth=78 formatoptions=tcroqn2l


" Python ---------------------------------------------------------------------

" execute Python file
nnoremap E :!python %<CR>

augroup lang_python
    autocmd FileType python setlocal
    \   shiftwidth=4 tabstop=4 softtabstop=4 expandtab nowrap
    \   formatoptions+=croq " c+r+o+q
    \   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    \   complete+=k~/.vim/syntax/python.vim isk+=.,(

    let python_highlight_all = 1

    " Hide # comment markers from folded text in Python scripts.
    "autocmd FileType python set commentstring=#%s

    " PyRef shortcut
    let g:pyref_mapping = 'K'
augroup END


" Functions ------------------------------------------------------------------

" Auto completion with <TAB> if not after whitespace
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    elseif "forward" == a:direction
        return "\<c-n>"
    "elseif "omni" == a:direction
    "    return "\<c-x>\<c-o>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper("forward")<CR>
inoremap <S-tab> <c-r>=InsertTabWrapper("backward")<CR>
"inoremap <C-tab> <c-r>=InsertTabWrapper("omni")<CR>

" toggle tab completion
function! ToggleTabCompletion()
    if mapcheck("\<tab>", "i") != ""
        :iunmap <tab>
        :iunmap <s-tab>
        :iunmap <c-tab>
        echo "tab completion off"
    else
        :imap <tab> <c-n>
        :imap <s-tab> <c-p>
        :imap <c-tab> <c-x><c-l>
        echo "tab completion on"
    endif
endfunction

map <leader>tc :call ToggleTabCompletion()<CR>


" import local .vimrc file ---------------------------------------------------
"if filereadable($HOME.'/.local.dotfiles/vimrc')
if filereadable(expand('~/.local.dotfiles/vimrc'))
    source ~/.local.dotfiles/vimrc
endif
