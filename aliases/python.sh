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
