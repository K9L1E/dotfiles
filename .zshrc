# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/Cellar/libpq/11.2/bin

# Distinction of host os ...
if [[ "$(uname)" == "Darwin" ]]; then
    # Do something under Mac OS X platform        
  echo "MacOs"
  export TERM="xterm-256color-italic"
  bindkey -M viins '^[[3~'   delete-char
  eval $(thefuck --alias)
  POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{yellow}\uF460 %f'
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    # Do something under GNU/Linux platform
  echo "Linux"
  export TERM="xterm-256color"
  bindkey -M viins '\C-H'  backward-kill-word
  if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  	source /etc/profile.d/vte.sh
  fi
  POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{yellow}\uF105 %f'
fi

# Some overall environment
export AWS_DEFAULT_PROFILE=""
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

# antigen ...
source ~/.antigen/bin/antigen.zsh

antigen use oh-my-zsh                               > /dev/null

# plugins from default library (oh-my-zsh)
# plugins=(aws git docker fasd kubectl vi-mode z)
plugins=(autoenv aws git docker fasd kubectl vi-mode z)
for plugin in $plugins
do
  antigen bundle $plugin  > /dev/null
done

antigen bundle zsh-users/zsh-autosuggestions        > /dev/null
antigen bundle zsh-users/zsh-syntax-highlighting    > /dev/null

# Choose theme
# antigen theme pygmalion
antigen theme bhilburn/powerlevel9k powerlevel9k    

antigen apply                                       

# Powerlevel9k Settings:
# https://github.com/bhilburn/powerlevel9k
#
if ! [[ -z ${K8S_CONTEXT} ]]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(kubecontext newline context_joined dir vcs)
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(pyenv newline context_joined dir vcs)
fi

#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws status time)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=''
POWERLEVEL9K_TIME_FOREGROUND='232'
POWERLEVEL9K_TIME_BACKGROUND='071'
POWERLEVEL9K_PYENV_FOREGROUND="blue"
POWERLEVEL9K_PYENV_BACKGROUND="black"
POWERLEVEL9K_AWS_FOREGROUND="blue"
POWERLEVEL9K_AWS_BACKGROUND="black"
POWERLEVEL9K_CONTEXT_TEMPLATE=sven
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_SHORTEN_DELIMITER="."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=137"
export EDITOR=vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=20

# # Change cursor shape for different vi modes.
function print_dcs
{
  print -n -- "\EP$1;\E$2\E\\"
}

function set_cursor_shape
{
  if [ -n "$TMUX" ]; then
    # tmux will only forward escape sequences to the terminal if surrounded by
    # a DCS sequence
    print_dcs tmux "\E]50;CursorShape=$1\C-G"
  else
    print -n -- "\E]50;CursorShape=$1\C-G"
  fi
}

function zle-keymap-select zle-line-init
{
  case $KEYMAP in
    vicmd)
      set_cursor_shape 0 # block cursor
      ;;
    viins|main)
      set_cursor_shape 1 # line cursor
      ;;
  esac
  zle reset-prompt
  zle -R
}

function zle-line-finish
{
  set_cursor_shape 0 # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


# Bind special vim shortcuts to vi-mode
# By default bindkey binds keys in insert mode
# bindkey -M vicmd binds in command mode
# bindkey -a       is short for command mode
# Binds in insert mode
bindkey -v
bindkey -M viins 'jj'    vi-cmd-mode
 

source <(kubectl completion zsh)
# source <(kubectl completion)

# Some environment for go language
export GOPATH="${HOME}/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"



