all:
	stow --restow zsh
	stow --restow brew
	stow --restow git
	stow --restow vim
	stow --restow config
	stow --restow gradle
	@# --no-folding = create symlinks for each file in the file tree.
	@# This allows to stow private match files from another repo.
	stow --restow --no-folding Library
