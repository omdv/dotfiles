#/usr/bin/zsh
setopt PROMPT_SUBST
autoload -U colors; colors

if [[ "$TERM" != "dumb" ]]; then
  local reset="%{$reset_color%}"
  local fst=214
  local snd=063
  local trd=197
  local dim=059
else
  local indicator=">"
fi

# Define hooks
# autoload -U add-zsh-hook
# add-zsh-hook precmd update_prompt
# add-zsh-hook preexec update_prompt

prompt () {
    PS1="$(current_pwd)  $(pyenv_version) >> ${reset}"
    RPS1=$'$(last_exit_code) $(colored_time)'
}

precmd_functions+=(prompt)

current_pwd() {
  echo $(pwd | sed -e "s,^$HOME,^,")
}

last_exit_code() {
  local result="%F{${dim}}(%f%B%F{${trd}}%?%b%f%F{${dim}}%)%f"
  echo -n "%(?..${result})"
}

colored_time() {
  local result="%F{${dim}}$(date +"%H%%{%%F{${fst}}%%}:%%{%%F{${dim}}%%}%M%%{%%F{${fst}}%%}:%%{%%F{${dim}}%%}%S")%f"
  echo -n "${result}"
}

pyenv_version() {
  echo -n "%F{${snd}}[%f"
  local shell_version=$(echo $PYENV_VERSION)
  if [ ! -z $shell_version ]; then
    echo -n "%F{${fst}}${shell_version}%f"
  else
    local global_version=$(cat $HOME/.pyenv/version)
    if [ $global_version = "system" ]; then
      echo -n "%F{${fst}}$global_version%f"
    else
      echo -n "%F{${fst}}system%f"
    fi
  fi
  echo -n "%F{${snd}}]%f"
}

RPS1="[$?]%F{${dim}}$(date +'%H:%M:%S')${reset}"
# RPS1="%{$fg[063]%}$(date +'%H'):%{$fg[green]%}$(date +'%M:%S')%{$reset_color%}%"

# PROMPT="$(current_pwd) $(pyenv_version) >> "
# RPS1="[$?]%F{${dim}}$(date +'%H:%M:%S')${reset}"


# # show git branch/tag, or name-rev if on detached head
# parse_git_branch() {
#   (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
# }

# # show red star if there are uncommitted changes
# parse_git_dirty() {
#   if command git diff-index --quiet HEAD 2> /dev/null; then
#     echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
#   else
#     echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
#   fi
# }

# # if in a git repo, show dirty indicator + git branch
# git_custom_status() {
#   local git_where="$(parse_git_branch)"
#   [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
# }

# # show current rbenv version if different from rbenv global
# rbenv_version_status() {
#   local ver=$(rbenv version-name)
#   [ "$(rbenv global)" != "$ver" ] && echo "[$ver]"
# }

# # put fancy stuff on the right
# if which rbenv &> /dev/null; then
#   RPS1='$(git_custom_status)%{$fg[red]%}$(rbenv_version_status)%{$reset_color%} $EPS1'
# else
#   RPS1='$(git_custom_status) $EPS1'
# fi

