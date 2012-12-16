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
- `⌃h`, `⌃l` — insert a new line below/above
- {normal|visual} `⌃n`, `⌃p` — move line down/up
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
- `⌃t` — new tab


### Splits

- `;h`, `;l` — go to left/right split
- `;k`, `;j` — go to left/right split
- `;H`, `;L` — create a split on the left/right side
- `;K`, `;J` — create a split above/below
- `+`, `-` = `_` — increase/decrease split size
- `;=` — set width of all splits to equal size


### Toggles

- `;pp` — toggle paste mode
- `;\` — toggle line wrapping
- `;inv` — toggle invisibles
- `;num` — toggle line numbers
- `;C` — toggle "keep current line in the center of the screen" mode


### Set Filetype

- `_d` — diff
- `_md` — markdown
- `_dp` — django python
- `_dh` — django html


### Mac OS X

- `⌘k`, `⌘{` — go to previous tab
- `⌘j`, `⌘}` — go to next tab
- `⌘1` – `⌘9` — switch to tab #


### Python

- `E` — execute in python


## VIM plugins

- [CtrlP](http://kien.github.com/ctrlp.vim/)
    - Commands and help
        1. run `:helptags ~/.vim/bundle/ctrlp/doc` in vims command mode
        2. open CtrlP with `:CtrlP` or `⌃p` and type `?` to show the help
    - `⌃p` — show CtrlP fuzzy file/buffer/MRU finder
    - `⌃n`, `⌃p` — select next/previous search from history
    - `⌃f`, `⌃b` — switch between search modes (file/buffer/MRU)
    - `⌃r` — switch to regex search
    - `⌃d` — switch to filename/full path search
- [Tagbar](http://majutsushi.github.com/tagbar/)
    - `⌃t` — show Tagbar outline viewer
- [vim surround](https://github.com/tpope/vim-surround)
    - change, delete, add surroundings
    - possible surroundings: ", ', \`, (, ), {, }, [, ] or even \<q\> for html tags, etc.
        - { adds a space, } doesn't
    - normal mode
        - `cs<oldc><newc>` [ `cs"(` ] — **c**hange **s**urround from \<oldc\> to \<newc\>
        - `ds<c>` [ `ds"` ] — **d**elete **s**urrounding \<c\>
        - `ys<object><c>` [ `ysiw]` ] — add [] around text object (*inner word*)
        - `yss<c>` [ `yss)` ] — add () around entire line
    - surround selection with quotes, parentheses, braces, etc..
        1. select something in visual mode
        2. `S(`, `S)`, `S[`, `S]`, `S{`, `S}`, `S"`, `S'`, `` S` ``
        - useful for example with the following:
            1. type some text
            2. `;v` to select the recently typed text (;v is no vim default, defined before)
            3. `S"` to make a quote
- [Comma Object](https://github.com/austintaylor/vim-commaobject)
    - change/delete arguments in function calls (or simply comma delimited (), [] or {} lists)
    - `da,`, `di,`, `ca,`, `ci,` — delete/change a comma/inner comma
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
- [http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/]()
- [http://concisionandconcinnity.blogspot.de/2009/07/vim-part-ii-matching-pairs.html]()


## Help

- [http://vim.wikia.com/wiki/Best_Vim_Tips]()
- [http://vim.wikia.com/wiki/Remove_unwanted_spaces]()
- [http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion]()
- [http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table]()
