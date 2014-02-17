. ~/.bashrc

export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
export PS1='\u: \w \$ '
eval "$(rbenv init -)"
export JRUBY_OPTS="--2.0"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
