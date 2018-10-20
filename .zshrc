export ZSH="/home/ghz/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  zsh-autosuggestions
  vi-mode
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Colors:
eval `dircolors ~/.dir_colors/dircolors`

# Highlighting:
source /home/ghz/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Large history file
HISTSIZE=10000000
SAVEHIST=10000000

# History search using up/down keys
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
# Prevent duplicates in history
setopt hist_ignore_all_dups hist_save_nodups

# Remove hostname:
prompt_context() {} 

# Aliases:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc

# My aliases:
alias lg='ll | grep '
alias hg='history | grep '
alias hv='history | vim -'
alias copy='xsel -ib'
alias paste='xsel --clipboard'
alias vimclipboard='paste | vim -'
alias mv="mv -v"
alias rm="rm -vi"
alias cp="cp -v"
alias install="sudo apt install "
alias update="sudo apt update"

# My functions:
mkdircd () {
    mkdir "$@"
    if [ "$1" = "-p" ]; then
        cd "$2"
    else
        cd "$1"
    fi
}

pathtofile () {
  case "$1" in
    /*) printf '%s\n' "$1";;
    *) printf '%s\n' "$PWD/$1";;
  esac
}

function findtextinfiles 
{
  grep -rnw '.' -e "$1"; 
}
