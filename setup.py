import os
import os.path as path
import subprocess

print('Installing vundle...')
subprocess.run(['git', 'clone',  'https://github.com/gmarik/vundle.git', path.expanduser('~/.vim/bundle/vundle')])
subprocess.run(['vim', '-c', ':BundleInstall'])
print('Vundle installed')

print('Installing fonts')
if not path.exists(path.expanduser('~/.fonts')):
    os.mkdir(path.expanduser('~/.fonts'))
subprocess.run(['cp', 'fonts/Sauce Code Powerline Regular.otf', path.expanduser('~/.fonts')])
subprocess.run(['fc-cache', '-fv'])

print('Moving dotfiles')
subprocess.run(['cp', '.bash_aliases', '.gitconfig', '.pythonrc.py', '.vimrc', path.expanduser('~')])
subprocess.run(['cp', '.config/flake8', '.config'])

# appending bashrc-virtualenv to bashrc
bashrc_venv = subprocess.run(['cat', '.bashrc-virtualenv'], stdout=subprocess.PIPE, universal_newlines=True)
bashrc = subprocess.run(['cat', path.expanduser('~/.bashrc')], stdout=subprocess.PIPE, universal_newlines=True)
bashrc = '{}\n{}'.format(bashrc.stdout, bashrc_venv.stdout)
with open(path.expanduser('~/.bashrc'), 'w') as f:
    f.write(bashrc)
print('dotfiles has been sucessfully installed')
