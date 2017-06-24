import os
import os.path as path
import subprocess

print('Installing vundle...')

subprocess.run([
    'git', 'clone', 'https://github.com/gmarik/vundle.git',
    path.expanduser('~/.vim/bundle/vundle'),
])
subprocess.run([
    'vim', '-c', ':BundleInstall'
])

print('Vundle installed')

print('Installing fonts')

if not path.exists(path.expanduser('~/.fonts')):
    os.mkdir(path.expanduser('~/.fonts'))

subprocess.run([
    'cp', 'fonts/Sauce Code Powerline Regular.otf',
    path.expanduser('~/.fonts'),
])
subprocess.run([
    'fc-cache', '-fv'
])

print('Moving dotfiles...')

subprocess.run([
    'cp', '-ax',
    '.bash_aliases', '.gitconfig', '.gitignore_blobal', '.pythonrc.py',
    '.vimrc', '.tmux.conf', '.virtualenvs', '.bash_profile',
    path.expanduser('~')
])
subprocess.run([
    'cp', '-ax', '.config/*', path.expanduser('~/.config')
])


# appending bashrc-extra to bashrc


print('Updating .bashrc...')

bashrc_venv = subprocess.run(
    ['cat', '.bashrc-extra'],
    stdout=subprocess.PIPE, universal_newlines=True
)
bashrc = subprocess.run(
    ['cat', path.expanduser('~/.bashrc')],
    stdout=subprocess.PIPE, universal_newlines=True
)

bashrc = '{}\n{}'.format(bashrc.stdout, bashrc_venv.stdout)
with open(path.expanduser('~/.bashrc'), 'w') as f:
    f.write(bashrc)

print('dotfiles has been sucessfully installed')
