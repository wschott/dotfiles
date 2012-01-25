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

- `,vs` — reload .vimrc
- `;` = `:` — easier command typing
- `jk` — exit to normal mode
- `H` — go to start of line
- `L` — go to EOL (end of line)
- `Y` — yank to EOL
- `⇥` — go to corresponding bracket
- `,d` — open directory of current file in current tab
- `,dt` — open directory of current file in new tab
- `,cd` — open current file's directory
- `Y` — copy (yank) from cursor to EOL
- `,*` — replace word under cursor
- `>` — indent current block
- `<` — deindent current block
- `,,`, `,␣`, `,/` — toggle search highlight
- `Q` — reformat paragraph
- `,Q` — reformat file
- `⌃␣` — omni completion
- `⇥`, `⇧⇥` — dictionary completion
- `;;` — add a semi colon at EOL
- `::` — add a colon at EOL
- `,U` — upper first char of word
- `,L` — lower first char of word
- `zj` — insert a newline below
- `zk` — insert a newline above
- `;j` — move line down
- `;k` — move line up
- `gw` — swap word
- `gc` — swap character
- `fc` — find merge conflict marker
- `,y`, `,Y` — copy to OS clipboard
- `,p`, `,P`, `,v`, `⌃v` — paste from OS clipboard
- `␣` — page down
- `⇧␣`, `⌫` — page up

### Tabs

- `⌃j` — go to previous tab
- `⌃k` — go to next tab
- `⌃t` — new tab
- `te` — tabedit
- `,ew` — edit
- `,et` — tabedit
- `,es` — split
- `,ev` — vsplit

### Splits

- `+` — increase split size
- `-` — decrease split size
- `,+` — increase split size (50 times)
- `,-` — decrease split size (50 times)
- `,=` — set width of all splits to equal size
- `⌃h` — go to left split
- `⌃l` — go to right split
- `,h` — create a split on the left side
- `,l` — create a split on the right side
- `,k` — create a split above
- `,j` — create a split below

### Toggles

- `,inv` — toggle invisibles
- `,pp` — toggle paste mode
- `,\` — toggle line wrapping
- `,tc` — toggle completion with tab key

### Commands

- `:W` — Alias to `:w`

### Python

- `E` — execute in python

### Mac OS X

- `⌘j`, `⌘}` — go to next tab
- `⌘k`, `⌘{` — go to previous tab
- `⌘1` – `⌘9` — switch to tab #


## VIM plugins

- [SnipMate](http://www.vim.org/scripts/script.php?script_id=2540)
- [vim git](https://github.com/tpope/vim-git)
- [taskpaper](https://github.com/davidoc/taskpaper.vim)
    - `,td` — mark as done
    - `,tx` — mark as cancelled
    - `,tp` — fold all projects
    - `,ta` — show all projects
    - `,tc` — show all tasks with context under cursor
- [PyRef](https://github.com/xolox/vim-pyref)
    - `K` — show python reference in browser
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
