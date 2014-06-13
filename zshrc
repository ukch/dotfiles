# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery command-not-found debian django git github nyan python)

source $ZSH/oh-my-zsh.sh

setopt interactivecomments

# Customize to your needs...
export PATH=/home/joelcross/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export LESSOPEN="| /usr/bin/lesspipe %s";
export LESSCLOSE="/usr/bin/lesspipe %s %s";

source ~/.aliases
source /etc/bash_completion.d/virtualenvwrapper

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# Switch virtualenv when you switch dir
has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    else
        type deactivate > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            deactivate
        fi
    fi
}
venv_cd () {
    builtin cd "$@" && has_virtualenv
}
# This doesn't work with .project files
#alias cd="venv_cd"

alias venv=has_virtualenv

venv  # Try and get into a virtualenv on start
