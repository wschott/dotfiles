# dotfiles

My bash configuration files with a couple of useful aliases.


## Installation

### Automatic way

Fire up your terminal and type the following in it:

	curl https://raw.github.com/wschott/dotfiles/master/install.sh | sh

Don't worry, all your old files will be backed up!

### Manual way

	git clone git://github.com/wschott/dotfiles.git ~/.dotfiles
	~/.dotfiles/install.sh


## Update every now and then

by running:

	~/.dotfiles/install.sh


## VIM Mappings

### General

- `,inv` Toggle invisibles.
- `,e` Opens an edit command with current file's path as directory.
- `te` Opens an edit commend for a new tab.
- `,t` Duplicate current tab.
- `,d` Open directory of current file in current tab.
- `,dt` Open directory of current file in new tab.
- `,cd` Open current file's directory.
- `,ls` Show buffers (same as `:buffers`).
- `,,` Toggle search highlight.
- `H` Go to start of line.
- `L` Go to end of line.
- `,ss` Strip trailing whitespace.
- `,S` Strip trailing whitespace.
- `Y` Yank from cursor to end of line (same as `y$`).
- `,*` Replace word under cursor.
- `>` Indent current block.
- `<` Outdent current block.
- `zj` Insert a newline below.
- `zk` Insert a newline above.
- `,ve` Edit .vimrc in a new tab.
- `,vu` Source .vimrc.
- `Q` Reformat paragraph.

### Tabs

- `tn` Go to next tab.
- `tp` Go to previous tab.

### Splits

- `+` Increase split size.
- `-` Decrease split size.
- `;+` Increase split size.
- `;-` Decrease split size.
- `⌃j` Go to split below.
- `⌃k` Go to split above.
- `⌃h` Go to split left.
- `⌃l` Go to split right.
- `,←` Create a split on the left side.
- `,→` Create a split on the right side.
- `,↑` Create a split above.
- `,↓` Create a split below.

### Commands

- `:W` Alias to `:w`


## VIM plugins

- [PyFlakes](https://github.com/kevinw/pyflakes-vim) checks code for errors
- [vim git](https://github.com/tpope/vim-git)


## Thanks to...

- [Gianni Chiappetta (gf3)](https://github.com/gf3/dotfiles)
- [Zach Holman (holman)](https://github.com/holman/dotfiles)
- [Ryan Tomayko (rtomayko)](https://github.com/rtomayko/dotfiles)
- [Henrik Nyh (henrik)](https://github.com/henrik/dotfiles)
- [Mathias Bynens (mathiasbynens)](https://github.com/mathiasbynens/dotfiles)
- [Jan Moesen (janmoesen)](https://github.com/janmoesen/tilde)
- [Steve Losh (sjl)](https://bitbucket.org/sjl/dotfiles)
