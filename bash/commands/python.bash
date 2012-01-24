#!/bin/bash

# Python ---------------------------------------------------------------------
alias py='python'
alias ipy='ipython'

# virtualenvwrapper support --------------------------------------------------
if [[ ! -z $(which virtualenvwrapper.sh) ]]; then
    export WORK_ON='~/.virtualenvs'
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source $(which virtualenvwrapper.sh)
fi


# Django ---------------------------------------------------------------------
dj() {
    python manage.py "$@"
}
complete -F _django_completion -o default dj

alias djr='python manage.py runserver'


# search Django source files -------------------------------------------------
# /via https://code.djangoproject.com/wiki/CookBookScriptsAliases
export DJROOT=/usr/lib/python2.7/site-packages/django
if [[ $(uname) == 'Darwin' ]]; then
    export DJROOT=/Library/Python/2.7/site-packages/django
fi
fdj() {
    ack --python --html $* $DJROOT
}


# scan python files for PEP-8 coding syle erros ------------------------------
alias pep8scan='pep8 --repeat --show-source --statistics'


# serve current folder on port $1 or 8000 ------------------------------------
serve() {
    python -m SimpleHTTPServer ${1:-8000}
}
