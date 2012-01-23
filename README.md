# dotfiles

My bash configuration files with a couple of useful aliases.


## Installation

### Automatic way

Fire up your terminal and type the following in it:

    $ curl https://raw.github.com/wschott/dotfiles/master/install.sh | sh

Don't worry, all your old files will be backed up!

### Manual way

    $ git clone git://github.com/wschott/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/install.sh

### Add requirements

    $ git submodule init
    $ git submodule update


## Update every now and then

by running:

    $ ~/.dotfiles/install.sh


## VIM Mappings

### General

- `,inv` — Toggle invisibles.
- `,e` — Opens an edit command with current file's path as directory.
- `te` — Opens an edit commend for a new tab.
- `,t` — Duplicate current tab.
- `,d` — Open directory of current file in current tab.
- `,dt` — Open directory of current file in new tab.
- `,cd` — Open current file's directory.
- `,,` — Toggle search highlight.
- `H` — go to start of line
- `L` — go to end of line
- `Y` — Yank from cursor to end of line (same as `y$`).
- `,*` — Replace word under cursor.
- `>` — indent current block
- `<` — unindent current block
- `zj` — insert a newline below
- `zk` — insert a newline above
- `,ve` — Edit .vimrc in a new tab.
- `,vu` — Source .vimrc.
- `Q` — reformat paragraph

### Tabs

- `⌃j` — go to previous tab
- `⌃k` — go to next tab

### Splits

- `+` — increase split size
- `-` — decrease split size
- `;+` — increase split size
- `;-` — decrease split size
- `⌃h` — go to left split
- `⌃l` — go to right split
- `,←` — Create a split on the left side.
- `,→` — Create a split on the right side.
- `,↑` — Create a split above.
- `,↓` — Create a split below.

### Commands

- `:W` — Alias to `:w`


## VIM plugins

- <strike>[PyFlakes](https://github.com/kevinw/pyflakes-vim) checks code for errors</strike>
- [SnipMate](http://www.vim.org/scripts/script.php?script_id=2540)
- [vim git](https://github.com/tpope/vim-git)
- [PyRef](https://github.com/xolox/vim-pyref)
    - `` — show python reference in browser
- Python (by Sergei Matusevich)
    - `%` — jump to the end of the indented block and back
    - `FN-F5` — execute current file


## Thanks to...

- [Gianni Chiappetta (gf3)](https://github.com/gf3/dotfiles)
- [Zach Holman (holman)](https://github.com/holman/dotfiles)
- [Ryan Tomayko (rtomayko)](https://github.com/rtomayko/dotfiles)
- [Henrik Nyh (henrik)](https://github.com/henrik/dotfiles)
- [Mathias Bynens (mathiasbynens)](https://github.com/mathiasbynens/dotfiles)
- [Jan Moesen (janmoesen)](https://github.com/janmoesen/tilde)
- [Steve Losh (sjl)](https://bitbucket.org/sjl/dotfiles)
