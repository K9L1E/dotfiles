# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/sbin

# Some environment
# All 256 colors:
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
export TERM="xterm-256color"

source ~/.antigen/bin/antigen.zsh
 
antigen use oh-my-zsh
 
# plugins from default library (oh-my-zsh)
plugins=(aws git docker fasd kubectl vi-mode z)
for plugin in $plugins
do
  antigen bundle $plugin
done
 
 
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

# antigen...
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
 
# Choose theme
# antigen theme pygmalion
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Powerlevel9k Settings:
# https://github.com/bhilburn/powerlevel9k
#
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_TIME_FOREGROUND='232'
POWERLEVEL9K_TIME_BACKGROUND='071'
POWERLEVEL9K_CONTEXT_TEMPLATE=k@S
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER="."
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

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/vault vault

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=20

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
    #echo -ne '\033]12;#83C048\007'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use insert mode shape cursor on startup.
echo -ne '\e[5 q'

# Use insert mode shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}


# Bind special vim shortcuts to vi-mode
# By default bindkey binds keys in insert mode
# bindkey -M vicmd binds in command mode
# bindkey -a       is short for command mode
# Binds in insert mode
bindkey -v
bindkey -M viins 'jj'      vi-cmd-mode
bindkey -M viins '^[[3~'   delete-char

# Binds in command mode
# ...

# Distinction of host os ...
if [[ "$(uname)" == "Darwin" ]]; then
    # Do something under Mac OS X platform        
  echo "MacOs"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    # Do something under GNU/Linux platform
  echo "Linux"
fi

