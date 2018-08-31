# Fix color for fisher man log
set -gx fish_color_match "red"
set -gx fish_greeting ''

# fzf settings 
set -gx FZF_FIND_FILE_COMMAND 'fd --type file --follow --color=always'
set -gx FZF_FIND_FILE_OPTS "--preview 'bat --color "always" {}'"

# source aliases and functions
source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

# source secrets
source ~/.profile-secrets/secrets.sh

# Borg settings
set -gx BORG_RSH "/Users/om/.borg/borg-bandwidth-limiter.sh ssh"

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
