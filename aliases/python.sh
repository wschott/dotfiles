# Python ---------------------------------------------------------------------
alias py='python'
alias i='ipython'

# virtualenvwrapper support --------------------------------------------------
export WORK_ON='~/.virtualenvs'
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Django ---------------------------------------------------------------------
# alias dj='python manage.py'
dj() {
    python manage.py "$@"
}
complete -F _django_completion -o default dj
alias djr='python manage.py runserver'

# search Djangos source files ------------------------------------------------
# /via https://code.djangoproject.com/wiki/CookBookScriptsAliases
if [[ $(uname) == 'Darwin' ]]; then
    DJROOT=/Library/Python/2.7/site-packages/django
else
    DJROOT=/usr/lib/python2.7/site-packages/django
fi
fdj() {
    grep -r --include="*.py" --include="*.html" $* $DJROOT
}
