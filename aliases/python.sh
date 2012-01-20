#!/bin/bash

# Python ---------------------------------------------------------------------
alias py='python'
alias i='ipython'

# virtualenvwrapper support --------------------------------------------------
if which virtualenvwrapper.sh >/dev/null 2>&1; then
    export WORK_ON='~/.virtualenvs'
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source $(which virtualenvwrapper.sh)
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
export DJROOT=/usr/lib/python2.7/site-packages/django
if [[ $(uname) == 'Darwin' ]]; then
    export DJROOT=/Library/Python/2.7/site-packages/django
fi
fdj() {
    grep -r --include="*.py" --include="*.html" $* $DJROOT
}
