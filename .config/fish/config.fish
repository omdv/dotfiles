# openSSL compiler settings
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"

# Fix color for fisher man log
set -gx fish_color_match "red"
set -gx fish_greeting ''

# fzf settings 
# set -gx FZF_FIND_FILE_COMMAND 'fd --type file --follow --color=always'
set -gx FZF_FIND_FILE_OPTS "--preview 'bat --color "always" {}'"
set -gx FZF_DEFAULT_OPTS ''

# source aliases and functions
source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

# source secrets
source ~/.profile-secrets/secrets.sh

# Borg settings
set -gx BORG_RSH "/Users/om/.backup/borg-bandwidth-limiter.sh ssh"

# Pyenv settings
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
pyenv rehash
status --is-interactive; and source (pyenv init -|psub)

# pyenv virtualenv
status --is-interactive; and source (pyenv virtualenv-init -|psub)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Homebrew
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Pass settings 
set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/gpg-agent/bin" $fish_user_paths

# GOlang
set -gx GOPATH "/Users/om/Documents/golang"
set -gx PATH $GOPATH/bin $PATH

# Fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# NVM
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
