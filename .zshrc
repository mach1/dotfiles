export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="afowler"

plugins=(git)
# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
ts () { tmux new -s "$1"; }

source $ZSH/oh-my-zsh.sh

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

export LANG=en_US.UTF-8

source ~/z/z.sh

alias vim="/usr/local/bin/nvim"
alias cat="bat"

export TERM=screen-256color

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(hub alias -s)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PHANTOMJS_BIN="/usr/local/bin/phantomjs"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Must be at very bottom to avoid conflicts with rvm
[ -s "/Users/jaanlambert/.scm_breeze/scm_breeze.sh" ] && source "/Users/jaanlambert/.scm_breeze/scm_breeze.sh"

export NVM_DIR="${HOME}/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm alias default 8
nvm use --delete-prefix v10.13.0 --silent
