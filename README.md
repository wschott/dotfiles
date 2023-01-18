# dotfiles

My bash configuration files with a couple of useful aliases.


## Installation

### Automatic way

Fire up your terminal and type the following in it:

    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/wschott/dotfiles/main/install)"

Don't worry, all your old files will be backed up!


### Manual way

    $ git clone git://github.com/wschott/dotfiles.git ~/.dotfiles
    $ ~/.dotfiles/install


## Update every now and then

by running:

    $ ~/.dotfiles/install


## VIM Mappings

Hints: `⎋` = ESC, `⌃` = CTRL, `␣` = SPACE, `⌘` = CMD on OSX

### General

- `;;` = `:` — easier command typing
- `jj`, `jk`, `;;` — exit to normal mode
- `H`, `L` — go to start/end of line (EOL)
- `U` — redo
- `Y` — yank (copy) from cursor to EOL
- `⎋⎋` — hide search highlights
- `Q` — reformat paragraph
- `S` — split line (opposite of `J` to join lines)
- `>`, `<` — indent/deindent current block
- `.` — repeat last command
    - `>`, `.` — indent many times
    - `<`, `.` — deindent many times
- `gw` — swap words
- {insert} `⌃F` — omni completion
- `␣` — fold/unfold current folding
- `;s` — substitute (search & replace)
- `;*` — replace word under cursor
- `;c` — find VCS merge conflict marker
- `;1` — add a Markdown H1 below current line
- `;v` — select the just pasted text
- {insert} `⌃v` — paste from OS clipboard
- `;y`, `;Y` — copy to OS clipboard
- `;p`, `;P` — paste from OS clipboard
- `;vs` — reload .vimrc
- `%%` — puts the current path to the command line
- `;ft` — fold html tag
- `;S` — sort CSS properties


### Open/Save/Close files

- `;e` — edit
- `;t` — tabedit
- `;es` — split
- `;ev` — vsplit
- `;w` — save
- `;W`, `;x`  — save and close file
- `;q` — close file
- `;Q` — close all files
- `;d` — open directory of current file in current tab
- `;dt` — open directory of current file in new tab


### Tabs

- `⌃j`, `⌃k` — go to previous/next tab


### Splits

- `⌃h`, `⌃l` — go to left/right split
- `;H`, `;L` — create a split on the left/right side
- `;K`, `;J` — create a split above/below
- `+`, `-` = `_` — increase/decrease split size
- `;=` — set width of all splits to equal size
- `T` — move split window into new tab
- `;mw` and `;pw` — swap split windows
    1. `;mw` — mark first window for swap
    2. `;pw` — swap current window with the previously marked one


### Toggles

- `;pp` — toggle paste mode
- `;\` — toggle line wrapping
- `;inv` — toggle invisibles
- `;num` — toggle line numbers
- `;C` — toggle "keep current line in the center of the screen" mode


### Set Filetype

- `_d` — diff
- `_md` — markdown


### Mac OS X

- `⌘k`, `⌘{` — go to previous tab
- `⌘j`, `⌘}` — go to next tab
- `⌘1` – `⌘9` — switch to tab #


## Thanks to...

- [Tommy Morgan](https://github.com/duwanis/vim_config)
- [Gianni Chiappetta (gf3)](https://github.com/gf3/dotfiles)
- [Zach Holman (holman)](https://github.com/holman/dotfiles)
- [Ryan Tomayko (rtomayko)](https://github.com/rtomayko/dotfiles)
- [Henrik Nyh (henrik)](https://github.com/henrik/dotfiles)
- [Mathias Bynens (mathiasbynens)](https://github.com/mathiasbynens/dotfiles)
- [Jan Moesen (janmoesen)](https://github.com/janmoesen/tilde)
- [Steve Losh (sjl)](https://bitbucket.org/sjl/dotfiles)
- [challendy](https://github.com/challendy/vim_bash_setup)
- [carlhuda](https://github.com/carlhuda/janus)
- [yodiaditya](https://github.com/yodiaditya/vim-pydjango)
- [How I boosted my Vim » nvie.com](http://nvie.com/posts/how-i-boosted-my-vim/)
- [http://www.jukie.net/~bart/conf/vimrc]()
- [http://stackoverflow.com/questions/164847/what-is-in-your-vimrc/171558#171558]()
- [http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim/4903681#4903681]()
- [http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/]()
- [http://concisionandconcinnity.blogspot.de/2009/07/vim-part-ii-matching-pairs.html]()


## Help

- [http://vim.wikia.com/wiki/Best_Vim_Tips]()
- [http://vim.wikia.com/wiki/Remove_unwanted_spaces]()
- [http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion]()
- [http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table]()
