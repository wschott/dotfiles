# extract files --------------------------------------------------------------
#   eg: ex archive.zip
ex() {
	if [[ -f $1 ]]; then
		case $1 in
			*.tar.bz2)	tar -xjf $1;;
			*.tar.gz)	tar -xzf $1;;
			*.bz2)		bunzip2 $1;;
			*.dmg)		hdiutil mount $1;;
			*.gz)		gunzip $1;;
			*.tar)		tar -xf $1;;
			*.tbz2)		tar -xjf $1;;
			*.tgz)		tar -xzf $1;;
			*.rar)		rar x $1;;
			*.zip)		unzip $1;;
			*.Z)		uncompress $1;;
			*.7z)		7z x $1;;
			*) echo "'$1' cannot be extracted via ex()";;
		esac
	else
		echo '"$1" is not a valid file'
	fi
}

# zip folders recursively by default
alias zip='zip -r'

# backup files by zipping them -----------------------------------------------
#   eg: backup archivename file1 dir1 file2 file3 dir2
backup() {
	NOW=$(date +"%Y-%m-%d_%H-%M-%S")
	ZIPFILE="$1-$NOW.zip"
	if [[ ! $# == 1 ]]; then
		# remove first argument (= archive name)
		shift 1
	fi
	ZIPFILE=$(echo "$ZIPFILE" | tr '/' '_' | tr ' ' '\ ' )
	zip "$ZIPFILE" "$@"
	echo "backup filename: ${ZIPFILE}"
}

# make a folder & jump there right now ---------------------------------------
mcd() {
	mkdir -p "$1" && cd "$1"
}

# search the history file ----------------------------------------------------
hf() {
	grep "$@" ~/.bash_history
}

# jump to directory and list all files ---------------------------------------
cl() {
	cd "$1"
	ls -lA
}

# show path the pretty way ---------------------------------------------------
showPath() {
    old=$IFS
    IFS=':'
    printf '%s\n' $PATH
    IFS=$old
}

# Open a manpage in Preview.app, which can be saved to PDF -------------------
pman() {
	man -t "$1" | open -f -a /Applications/Preview.app
}
