source ~/.vimrc

set novisualbell                    " turn visual error bells off
set noerrorbells                    " turn error bells off
" turn beeps off
set vb t_vb=

" remove ugly toolbar
set guioptions-=T

set lines=65
set columns=100

set background=light

try
    let g:solarized_termcolors=256
    colorscheme solarized
catch /E185:/
endtry

if filereadable(expand('~/.local.dotfiles/gvimrc'))
    source ~/.local.dotfiles/gvimrc
endif
