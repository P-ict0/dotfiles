set -g fish_greeting

if status is-interactive
    # Commands to run when starting an interactive session
    starship init fish | source
end

# List Directory
alias ls='eza -1 --icons=auto' # short list
alias l='eza -lh   --icons=auto' # long list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# my aliases
alias ping='prettyping'

# Python environment
alias ve='python3 -m venv ./venv'
alias va='. ./venv/bin/activate.fish'

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# Created by `pipx` on 2024-10-14 10:50:53
set PATH $PATH /home/rodri/.local/bin
set PATH $PATH /home/rodri/scripts

/usr/bin/macchina
