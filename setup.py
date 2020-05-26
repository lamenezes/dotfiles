import os
import os.path as path
import subprocess

print('Moving dotfiles...')

subprocess.run([
    'cp', '-ax',
    '.bash_aliases',
    '.bash_profile',
    '.config',
    '.editorconfig',
    '.gitconfig',
    '.gitignore_global',
    '.pythonrc.py',
    '.tmux.conf',
    '.vimrc',
    '.virtualenvs',
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

subprocess.run(
    ['dconf', 'load', '/org/gnome/terminal/'],
    stdin=open('./gnome-terminal-settings.txt')
)

os.system('curl https://pyenv.run | bash')

print('dotfiles has been sucessfully installed')
