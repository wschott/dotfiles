" Pathogen -------------------------------------------------------------------
call pathogen#infect()

" VIM settings ---------------------------------------------------------------
set nocompatible					" turn vi compatibility off
set encoding=utf-8					" UTF-8 encoding
set t_Co=256						" 256 colors
set history=1000					" command line history
set undolevels=1000					" undo history
set tabstop=4						" tab display width
set softtabstop=4					" tab width
set shiftwidth=4					" <TAB> indents this width
"set expandtab						" tabs -> spaces
set smarttab						" make <TAB> and <BS> smarter
set autoindent						" turn on auto indenting (match prev line)
set smartindent						" turn on smart indenting
set textwidth=79					" wrap text on this column
set showmatch						" show matching brackets
set number							" show line numbers
set relativenumber					" show relative line number (current line is still in status bar)
"set cursorline						" highlight current line
set backspace=eol,start,indent		" allow backspacing over EOL, ...
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:❯,precedes:❮	" set style of invisible characters
"set list!							" show invisible characters
set ruler							" show status line
set showcmd							" display incomplete commands
set showmode						" show current mode
set hlsearch						" highlight search results
set incsearch						" search-as-you-type
set ignorecase						" case-insensitive…
set smartcase						" …unless phrase includes uppercase
set gdefault						" add g flag to search/replace by default
set vb t_vb=						" turn beeps off
set visualbell						" visual beeps
set wrap							" turn wrapping on
"set nowrap							" turn wrapping off
set linebreak						" wrap only on word boundaries
set wildmenu						" : menu has tab completion
set wildmode=list:longest			" behave like in shell: show options
set wildignore+=.DS_Store,*.o,*.obj,*.pyc,*.png,*.jpg,.git
set backupdir=~/.vim/backup			" Directory for swp files
set directory=~/.vim/backup			" Directory for swp files
set scrolloff=5						" keep at least 5 lines above/below cursor
set sidescrolloff=5					" keep at least 5 columns left/right of cursor
"set foldmethod=marker				" folding
set splitbelow						" split new windows below current window
set splitright						" split new windows on the right side of current window
set laststatus=2					" always show the statusline, even if there is only one window
syntax on							" syntax highlighting

" Statusline -----------------------------------------------------------------
" %< truncation point
" \  space
" %f relative path to file
" %F absolute path to file
" %m modified flag [+] (modified), [-] (unmodifiable) or nothing
" %r readonly flag [RO]
" %y filetype [ruby]
" %= split point for left and right justification
" %-14.( %)  block of fixed width 14 characters
" %l current line
" %c current column
" %V current virtual column as -{num} if different from %c
" %P percentage through buffer
" %p percentage through buffer
set statusline=%#warningmsg#%*%<\ %F\ %m%r%y\ %=%-14.(%l,%c%V%)\ %P\ %v


" Mouse ----------------------------------------------------------------------
if has('mouse')
	set mouse=a				" enable mouse in all modes
endif

" Shortcuts ------------------------------------------------------------------
" easier command typing
"nnoremap ; :
"vnoremap ; :
" Swap ; and :  Convenient.
"nnoremap ; :
"nnoremap : ;
inoremap jk <ESC>			" exit to normal mode the easy way
nnoremap j gj				" move by screen line instead file line
nnoremap k gk				" move by screen line instead file line
vnoremap j gj				" move by screen line instead file line
vnoremap k gk				" move by screen line instead file line
nnoremap H ^				" jump to start of line (instead of top of screen)
nnoremap L g_				" jump to end of line (instead of bottom of screen)
noremap <C-h> <C-w>h		" go to split left
noremap <C-j> <C-w>j		" go to split below
noremap <C-k> <C-w>k		" go to split above
noremap <C-l> <C-w>l		" go to split right
nnoremap * *<C-o>			" Don't move on *
" nnoremap * *<C-o>zz		" Don't move on * & center view
nnoremap Q gqap				" reformat paragraph
"nnoremap Q gqip				" reformat paragraph
vnoremap Q gq				" reformat paragraph
map Y y$					" yank from cursor to $
map D d$					" delete from cursor to $
nmap n nzz					" search next & center view
nmap N Nzz					" search previous & center view
nmap > >>					" one-key indentation
nmap < <<					" one-key indentation
nnoremap <silent> zj o<ESC>	" insert a newline below
nnoremap <silent> zk O<ESC>	" insert a newline above
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <C-e> 5<C-e>		" faster scrolling
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>
"nnoremap <space> za			" Space will toggle folds

" insert a pair of quotes/braces
" inoremap ' ''<Left>
" inoremap " ""<Left>
" inoremap ( ()<Left>
" inoremap < <><Left>
" inoremap { {}<Left>
" inoremap [ []<Left>
" inoremap ( ()<Left>

" quickly add a comma/semi colon, colon at the end of the string
"inoremap ,, <END>,
inoremap ;; <END>;
inoremap :: <END>:

command! W w				" Remap :W to :w

" Tab navigation
nmap tp			:tabprevious<CR>		" tp
nmap tn			:tabnext<CR>			" tn
nmap <C-S-tab>	:tabprevious<CR>		" CTRL-SHIFT-TAB
nmap <C-tab>	:tabnext<CR>			" CTRL-TAB
vmap <C-S-tab>	<C-o>:tabprevious<CR>
vmap <C-tab>	<C-o>:tabnext<CR>
imap <C-S-tab>	<C-o>:tabprevious<CR>
imap <C-tab>	<C-o>:tabnext<CR>

" /via https://github.com/holman/dotfiles/blob/master/vim/gvimrc.symlink
if has("mac")
	nmap <D-k> :tabprevious<CR>				" CMD-J
	nmap <D-j> :tabnext<CR>					" CMD-K
	map  <D-[> :tabprevious<CR>				" CMD-[
	map  <D-]> :tabnext<CR>					" CMD-]
	imap <D-[> <C-O>:tabprevious<CR>
	imap <D-]> <C-O>:tabnext<CR>

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

" edit file in new tab
nmap te :tabedit

nmap + <C-W>>								" faster split resizing (+,-)
nmap - <C-W><
nmap <leader>+ 50<C-W>>
nmap <leader>- 50<C-W><
nmap ;+ <C-W>+
nmap ;- <C-W>-

nnoremap _md :set ft=markdown<CR>			" Easy filetype switching

" Moving lines up or down
"nnoremap ;j mz:m+<CR>`z==
"nnoremap ;k mz:m-2<CR>`z==
"inoremap ;j <Esc>:m+<CR>==gi
"inoremap ;k <Esc>:m-2<CR>==gi
"vnoremap ;j :m'>+<CR>gv=`<my`>mzgv`yo`z
"vnoremap ;k :m'<-2<CR>gv=`>my`<mzgv`yo`z

" /via https://github.com/challendy/vim_bash_setup/blob/master/vim_setup/keybindings.gui.vim
" OSX: Specific keybindings
if has("mac")
	set go-=T									" remove ugly toolbar

	" TextMateLikeIndent: bind CMD-] to shift right
	" nmap <D-]> >>
	" vmap <D-]> >>
	" imap <D-]> <C-O>>>

	" TextMateLikeDeindent: bind CMD-[ to shift left
	" nmap <D-[> <<
	" vmap <D-[> <<
	" imap <D-[> <C-O><<
endif

" /via https://bitbucket.org/sjl/dotfiles/src/b5e60ade957d/vim/.vimrc
" Split/Join {{{
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
" }}}



" Leader ---------------------------------------------------------------------
let mapleader=','						" start macros with ,
nmap <leader>inv :set list!<CR>			" toggle invisibles
map <leader>t :tabnew %<CR>				" duplicate current tab
map <leader>d :e %:h/<CR>				" open directory of current file in current tab
map <leader>dt :tabnew %:h/<CR>			" open directory of current file in new tab
map <silent> <leader><leader> <ESC>:noh<CR>	" clear last search


map <leader>ve :tabedit ~/.vimrc<CR>	" edit .vimrc
map <leader>vu :source ~/.vimrc<CR>		" update current vim settings


nmap <leader>cd :cd%:p:h<CR>			" change directory to that of current file


" /via https://github.com/gf3/dotfiles/blob/master/.vimrc
" Indent/unident block (,]) (,[)
" nnoremap <leader>] >i{<CR>
" nnoremap <leader>[ <i{<CR>


" /via https://github.com/gf3/dotfiles/blob/master/.vimrc
" Buffer navigation (,,) (,]) (,[) (,ls)
" map <leader>, <C-^>
" :map <leader>] :bnext<CR>
" :map <leader>[ :bprev<CR>
map <leader>ls :buffers<CR>


" toggle paste mode
" /via http://www.jukie.net/~bart/conf/vimrc
nmap <leader>pp :set paste!<cr>

" word swapping
" /via http://www.jukie.net/~bart/conf/vimrc
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>
" char swapping
" /via http://www.jukie.net/~bart/conf/vimrc
nmap <silent> gc xph

" Substitute
nnoremap <leader>s :%s//<left>

" find merge conflict markers
" /via http://www.jukie.net/~bart/conf/vimrc
map <leader>fc /\v^[<=>]{7}( .*\|$)<CR>

" /via https://github.com/gf3/dotfiles/blob/master/.vimrc
" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>


" /via https://github.com/gf3/dotfiles/blob/master/.vimrc
" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>



" Opens an edit command with the path of the currently edited file filled in
" /via https://github.com/henrik/dotfiles/blob/master/vimrc
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Create a split on the given side.
" /via https://github.com/henrik/dotfiles/blob/master/vimrc
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>		:leftabove  vsp<CR>
nmap <leader><right>	:rightbelow vsp<CR>
nmap <leader><up>		:leftabove  sp<CR>
nmap <leader><down>		:rightbelow sp<CR>


" Enable filetype plugin & indention files detection ------------------------
filetype plugin indent on


" Functions ------------------------------------------------------------------

" Strip trailing whitespace
map <leader>S :%s/\s\+$//gc<CR>:let @/=''<CR>

" Highlight trailing whitespace characters and tabs not used for indention
" /via https://github.com/mileszs/dotfiles/blob/master/vimrc
" highlight WhitespaceErrors ctermbg=Red guibg=Red
" match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/

" set shortcut for PyRef
let g:pyref_mapping = 'K'


" Color ----------------------------------------------------------------------
if has('gui_running')
	"set guifont=Monaco:h11
	set background=light
	let g:solarized_termcolors=256
	colorscheme solarized
else
	"color molokai
endif

" Auto Commands ---------------------------------------------------------- {{{
" /via http://stackoverflow.com/questions/164847/what-is-in-your-vimrc/171558#171558

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" jump to last line edited in a given file (based on .viminfo)
" /via http://www.jukie.net/~bart/conf/vimrc
autocmd BufReadPost *
        \ if line("'\"") > 0|
        \       if line("'\"") <= line("$")|
        \               exe("norm '\"")|
        \       else|
        \               exe "norm $"|
        \       endif|
        \ endif
" }}}


" enable autocompletion
set ofu=syntaxcomplete#Complete


" Python ---------------------------------------------------------------------
" smart indenting for python files (indent one more <TAB> after def foobar():)
autocmd FileType python setlocal
\   shiftwidth=4 tabstop=4 softtabstop=4 expandtab
\   formatoptions+=croq " c+r+o+q
\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
\   complete+=k~/.vim/syntax/python.vim isk+=.,(
let python_highlight_all = 1

" auto strip trailing whitespace in python
" /via http://www.vex.net/~x/python_and_vim.html
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" Python autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
" launch autocompletion by typing a . (dot) (for python code useful)
" /via http://vim.wikia.com/wiki/VimTip1548
"imap <silent> <buffer> . .<C-X><C-O>
"imap <silent> <expr> <buffer> <CR> pumvisible() ? "<CR><C-R>=(col('.')-1&&match(getline(line('.')), '\\.',
"      \ col('.')-2) == col('.')-2)?\"\<lt>C-X>\<lt>C-O>\":\"\"<CR>"
"      \ : "<CR>"





" Fugitive --------------------------------------------------------------- {{{
" /via https://bitbucket.org/sjl/dotfiles/src/b5e60ade957d/vim/.vimrc
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>

autocmd BufNewFile,BufRead .git/index setlocal nolist
" }}}

" Pydoc ------------------------------------------------------------------ {{{
let g:pydoc_perform_mappings = 0

au FileType python noremap <buffer> <leader>ds :call ShowPyDoc('<C-R><C-W>', 1)<CR>
au FileType python noremap <buffer> <leader>dS :call ShowPyDoc('<C-R><C-A>', 1)<CR>
" }}}

" " Execute the tests
" " /via https://github.com/nureineide/dotvim/blob/master/vimrc
" map <silent>tf <Esc>:Pytest file<CR>
" map <silent>tc <Esc>:Pytest class<CR>
" map <silent>tm <Esc>:Pytest method<CR>
" " cycle through test errors
" nmap <silent>tn <Esc>:Pytest next<CR>
" nmap <silent>tp <Esc>:Pytest previous<CR>
" nmap <silent>te <Esc>:Pytest error<CR>
" nmap <silent>tee <Esc>:Pytest end<CR>
