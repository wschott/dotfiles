source ~/.vimrc

set novisualbell                    " turn visual error bells off
set noerrorbells                    " turn error bells off
" turn beeps off
set vb t_vb=

" remove ugly toolbar
set guioptions-=T

set lines=65
set columns=100

if filereadable(expand('~/.local.dotfiles/gvimrc'))
    source ~/.local.dotfiles/gvimrc
endif
