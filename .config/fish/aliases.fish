# Quick edits
alias ea 'vim ~/.config/fish/aliases.fish'
alias ef 'vim ~/.config/fish/functions.fish'
alias ec 'vim ~/.config/fish/config.fish'
alias eg 'vim ~/.gitconfig'
alias ev 'vim ~/.vimrc'
alias ff "source ~/.config/fish/config.fish"

# Shortcuts
alias l "ls -alF"
alias .. "cd .."
alias g git
alias c clear
alias v vim
alias rmd "rm -rf"
alias sb "sublime"
bind \e\e 'prepend_command sudo'

# kubectl
alias k kubectl


# config repository
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Docker
alias dc "docker-compose"
alias dps "docker ps -a --format 'table {{.Image}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}'"

# Homebrew
alias brewski "brew update; brew upgrade; brew cleanup; brew doctor"

# Improved CLI
alias cat 'bat --style=numbers,changes'
alias ping 'prettyping --nolegend'
alias preview "fzf --preview 'bat --color \"always\" {}'"
alias du 'ncdu --color dark -rr -x --exclude .git --exclude node_modules'
