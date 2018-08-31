# Path variables
local ZSH_CONF=$HOME/.zsh                      # Define the place I store all my zsh config stuff
local ZSH_CACHE=$ZSH_CONF/cache                # for storing files like history and zcompdump 
local LOCAL_ZSHRC=$HOME/.zshlocal/.zshrc       # Allow the local machine to have its own overriding zshrc if it wants it

# Load external config files and tools
  source $ZSH_CONF/functions.zsh
  source $ZSH_CONF/spectrum.zsh
  source $ZSH_CONF/prompts.zsh
  source $ZSH_CONF/termsupport.zsh

  # autoload -Uz promptinit
  # promptinit
  # prompt walters
 
# shell variables
  export EDITOR=vim
  export PAGER=less
  export LESS="-R"
  export LANG="en_US.UTF-8"

# Misc
  declare -U path                             # prevent duplicate entries in path
  export CLICOLOR=YES
  LESSHISTFILE="/dev/null"                    # Prevent the less hist file from being made, I don't want it
  umask 002                                   # Default permissions for new files, subract from 777 to understand
  setopt NO_BEEP                              # Disable beeps
  setopt MULTI_OS                             # Can pipe to mulitple outputs
  unsetopt NO_HUP                             # Kill all child processes when we exit, don't leave them running

# ZSH History 
  alias history='fc -fl 1'
  HISTFILE=$ZSH_CACHE/history                 # Keep our home directory neat by keeping the histfile somewhere else
  SAVEHIST=10000                              # Big history
  HISTSIZE=10000                              # Big history
  setopt EXTENDED_HISTORY                     # Include more information about when the command was executed, etc
  setopt APPEND_HISTORY                       # Allow multiple terminal sessions to all append to one zsh command history
  setopt HIST_FIND_NO_DUPS                    # When searching history don't display results already cycled through twice
  setopt HIST_EXPIRE_DUPS_FIRST               # When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE 
  setopt HIST_IGNORE_SPACE                    # Don't enter commands into history if they start with a space
  setopt HIST_VERIFY                          # makes history substitution commands a bit nicer. I don't fully understand
  setopt SHARE_HISTORY                        # Shares history across multiple zsh sessions, in real time
  setopt HIST_IGNORE_DUPS                     # Do not write events to history that are duplicates of the immediately previous event
  setopt INC_APPEND_HISTORY                   # Add commands to history as they are typed, don't wait until shell exit
  setopt HIST_REDUCE_BLANKS                   # Remove extra blanks from each command line being added to history

# ZSH Auto Completion
  # # Figure out the short hostname
  # if [[ "$OSTYPE" = darwin* ]]; then          
  #   # OS X's $HOST changes with dhcp, etc., so use ComputerName if possible.
  #   SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
  # else
  #   SHORT_HOST=${HOST/.*/}
  # fi

  #the auto complete dump is a cache file where ZSH stores its auto complete data, for faster load times
  local ZSH_COMPDUMP="$ZSH_CACHE/acdump-${SHORT_HOST}-${ZSH_VERSION}"  #where to store autocomplete data

  autoload -Uz compinit
  compinit -i -d "${ZSH_COMPDUMP}"                        # Init auto completion; tell where to store autocomplete dump
  zstyle ':completion:*' menu select                      # Have the menu highlight as we cycle through options
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # Case-insensitive (uppercase from lowercase) completion
  setopt COMPLETE_IN_WORD                                 # Allow completion from within a word/phrase
  setopt ALWAYS_TO_END                                    # When completing from the middle of a word, move cursor to end of word
  setopt MENU_COMPLETE                                    # When using auto-complete, put the first option on the line immediately
  setopt COMPLETE_ALIASES                                 # Turn on completion for aliases as well
  setopt LIST_ROWS_FIRST                                  # Cycle through menus horizontally instead of vertically

# Globbing
  setopt NO_CASE_GLOB                         # Case insensitive globbing
  setopt EXTENDED_GLOB                        # Allow the powerful zsh globbing features, see link:
  setopt NUMERIC_GLOB_SORT                    # Sort globs that expand to numbers numerically, not by letter (i.e. 01 2 03)

# Aliases
  alias -g ...='../..'
  alias -g ....='../../..'
  alias -g .....='../../../..'
  alias -g ......='../../../../..'
  alias -g .......='../../../../../..'
  alias -g ........='../../../../../../..'

  alias l='ls -la'
  alias v='vim'
  alias ss='source ~/.zshrc'
  alias ez='vim ~/.zshrc'
  alias ev='vim ~/.vimrc'

  # Search running processes. Usage: psg <process_name>
  alias psg="ps aux $( [[ -n "$(uname -a | grep CYGWIN )" ]] && echo '-W') | grep -i $1"

  # Copy with a progress bar
  alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --" 

  alias d='dirs -v | head -10'                      # List the last ten directories we've been to this session, no duplicates

# Key Bindings
  bindkey "^K" kill-whole-line                      # [Ctrl-K] erase whole line
  bindkey "\e\e" sudo-command-line                  # [Esc] [Esc] - insert "sudo" at beginning of line
    zle -N sudo-command-line
    sudo-command-line() {
          [[ -z $BUFFER ]] && zle up-history
          if [[ $BUFFER == sudo\ * ]]; then
                LBUFFER="${LBUFFER#sudo }"
          else
                LBUFFER="sudo $LBUFFER"
          fi
    }

# Sourcing external tools and plugins
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # source $ZSH_CONF/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add tab completion to "cd.."
# zstyle ':completion:*' special-dirs true

# Pyenv
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

# Greeting
  echo "\033[38;5;${dim}m$(uname -mnprs)"

