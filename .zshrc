# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="kardan"
# ZSH_THEME="clean"
# ZSH_THEME="smt"
# ZSH_THEME="kafeitu"
ZSH_THEME="refined"
# ZSH_THEME="random"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# fzf setup
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --info=inline --preview 'bat --color=always {}'"

# Aliases
# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# fzf
alias ff="fzf --bind 'enter:become(nvim {})'"

export PYTHONDONTWRITEBYTECODE=TRUE
export PATH=$PATH:/usr/local/go/bin
alias clang++='clang++ -Wall -Wextra -std=c++17 -O3 -pedantic-errors -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all'
