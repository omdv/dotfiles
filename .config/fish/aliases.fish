# Quick edits
abbr ea 'vim ~/.config/fish/abbres.fish'
abbr ef 'vim ~/.config/fish/config.fish'
abbr eg 'vim ~/.gitconfig'
abbr ev 'vim ~/.vimrc'
abbr ff "source ~/.config/fish/config.fish"

# Shortcuts
abbr l "ls -alF"
abbr .. "cd .."
abbr g git
abbr c clear
abbr v vim
abbr rmd "rm -rf"
abbr sb "sublime"
bind \e\e 'prepend_command sudo'

# config repository
abbr config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Docker
abbr dc "docker-compose"
abbr dps "docker ps -a --format 'table {{.Image}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}'"

# Homebrew
abbr brewski "brew update; brew upgrade; brew cleanup; brew cask cleanup; brew doctor"

# Improved CLI
abbr cat 'bat --style=numbers,changes'
abbr ping 'prettyping --nolegend'
abbr preview "fzf --preview 'bat --color \"always\" {}'"
abbr du 'ncdu --color dark -rr -x --exclude .git --exclude node_modules'
