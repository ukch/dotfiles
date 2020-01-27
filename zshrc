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
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(chucknorris colored-man-pages debian django git github fabric heroku history node pip python sudo command-not-found docker-machine)

# Customize to your needs...
export PATH=$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

source $ZSH/oh-my-zsh.sh

setopt interactivecomments

export LESSOPEN="| /usr/bin/lesspipe %s";
export LESSCLOSE="/usr/bin/lesspipe %s %s";

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Fix for Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte-2.91.sh
fi

# Switch virtualenv when you switch dir
has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    else
        if [ -e Pipfile ]; then
            pipenv shell
            return
        fi
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

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

venv  # Try and get into a virtualenv on start
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/joel/.sdkman"
[[ -s "/home/joel/.sdkman/bin/sdkman-init.sh" ]] && source "/home/joel/.sdkman/bin/sdkman-init.sh"

# this must be at the end because aliasing 'rm' messes with the sdkman script
source ~/.aliases
