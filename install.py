#!/usr/bin/env python

import os
import shutil
import datetime

# specify files to symlink
FILES = [
    '.ackrc',
    '.bash_profile',
    '.bashrc',
    '.gitconfig',
    '.gitignore',
    '.inputrc',
    '.vim',
    '.vimrc',
    '.gvimrc',
    'bin'
]

NOW = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')

HOME = os.path.expanduser('~/')
DESTINATION = os.path.join(HOME, '.dotfiles')


def backup():
    """ Backup old `.dotfiles`. """
    if os.path.exists(DESTINATION):
        zipfile = '.dotfiles-backup-%s.zip' % NOW
        print '  to file: %s' % zipfile
        os.system('zip -rq %s %s' % (os.path.join(HOME, zipfile), DESTINATION))


def _copy_local_sample(filename):
    """ Copy local sample file specified by `filename` if user has none. """
    src = os.path.join(DESTINATION, 'local/%s.sample' % filename)
    dst = os.path.join(HOME, '.local.dotfiles', filename)
    if not os.path.exists(dst):
        shutil.copyfilehave(src, dst)


def install():
    """ Install new `.dotfiles`. """
    # symlink files
    for long_filename in FILES:
        # assume file doesn't start with a dot
        short_filename = long_filename
        if long_filename.startswith('.'):
            short_filename = long_filename[:1]

        s = ''
        if os.path.exists(os.path.join(HOME, long_filename)):
            # backup if user has this file
            final_filename = os.path.join(HOME, '.dotfiles-backup-%s-symlinks' % NOW, long_filename)
            s = (' | backup at: %s' % final_filename).replace(HOME, '~/')
            os.makedirs(os.path.join(HOME, '.dotfiles-backup-%s-symlinks' % NOW))
            shutil.move(os.path.join(HOME, long_filename), final_filename)

        print ('  symlink %s' %s long_filename).replace(HOME, '~/'), s
        os.symlink(
            os.path.join(DESTINATION, short_filename),
            os.path.join(HOME, long_filename)
        )


    os.makedirs(os.path.join(HOME, '.local.dotfiles'))

    for filename in ['bashrc', 'vimrc', 'gvimrc']:
        _copy_local_sample(filename)


if __name__ == '__main__':
    if os.path.exists(DESTINATION):
        print 'Backup ~/.dotfiles'
        backup()

    if os.path.exists(os.path.join(DESTINATION, '.git')):
        print 'Updating...'
        os.system('cd %s && git pull clone master' % DESTINATION)
    else:
        print 'Downloading...'
        os.system('git clone git://github.com/wschott/dotfiles.git %s' % DESTINATION)

    print 'Installing...'
    install()

    print 'Done'
    print "  don't forget to 'source ~/.bashrc'"
